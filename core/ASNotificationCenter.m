//
//  ASNotificationCenter.m
//  AppSafeNotificationCenter
//
//  Created by Aleksey Anisimov on 16.03.17.
//  Copyright © 2017 Aleksey Anisimov. All rights reserved.
//

#import "ASNotificationCenter.h"

@interface ASNotificationCenter()

@property (nonatomic, strong) NSMutableSet *targetSet;
@property (nonatomic, strong) NSLock *setLock;

+ (instancetype)sharedCenter;

@end

@implementation ASNotificationCenter

+(instancetype) protectedCenter{
    return [ASNotificationCenter sharedCenter];
}

+ (instancetype)sharedCenter {
    
    static ASNotificationCenter *asCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        asCenter = [[ASNotificationCenter alloc] init];
        asCenter.targetSet = [[NSMutableSet alloc] init];
        asCenter.setLock = [[NSLock alloc] init];
    });
    return asCenter;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable ASNotificationName)aName object:(nullable id)aObject{
   
    [self.setLock lock];
    
    ASNotifiation *_notif = [[ASNotifiation alloc] initObserver:observer selector:aSelector name:aName object:aObject];
    [self.targetSet addObject:_notif];
    
    [self.setLock unlock];
}


#pragma mark - Post Methods

- (void)postNotification:(ASNotifiation *)notification{
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    //ignore the warning
    @synchronized(self){
        if (notification.observer && notification.selector)
            [notification.observer performSelector:notification.selector withObject:notification];
    }

    
#pragma clang diagnostic pop
    
}

- (void)postNotificationName:(ASNotificationName)aName object:(id)anObject{
    [self postNotificationName:aName object:anObject userInfo:nil];
    
}

- (void)postNotificationName:(ASNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo{
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(ASNotifiation *obj, NSDictionary *bindings) {
        return [obj.name isEqualToString:aName];
    }];
    ASNotifiation *filteredObject = [self.targetSet filteredSetUsingPredicate:predicate].anyObject;
    if (filteredObject){
        filteredObject.object = anObject;
        filteredObject.userInfo = aUserInfo;
        
        [self postNotification:filteredObject];
    }
}


#pragma mark - removeObserver Methods

- (void)removeObserver:(id)observer{
    [self removeObserver:observer name:nil object:nil];
}

- (void)removeObserver:(id)observer name:(nullable ASNotificationName)aName object:(nullable id)anObject{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(ASNotifiation *obj, NSDictionary *bindings) {
        if (!aName)
            return [obj.observer isKindOfClass:[observer class]];
        
        return [obj.observer isKindOfClass:[observer class]] && [obj.name isEqualToString:aName];
    }];
    
    
    NSSet<ASNotifiation *> *arraySet = [self.targetSet filteredSetUsingPredicate:predicate];
      [self.setLock lock];
    for (ASNotifiation *_notif in arraySet) {
        [self.targetSet removeObject:_notif];
        
    }
    [self.setLock unlock];
}

@end
