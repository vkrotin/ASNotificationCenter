//
//  ASNotifiation.h
//  AppSafeNotificationCenter
//
//  Created by Aleksey Anisimov on 16.03.17.
//  Copyright © 2017 Aleksey Anisimov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *ASNotificationName NS_EXTENSIBLE_STRING_ENUM;

@interface ASNotifiation : NSObject

@property (nonatomic, strong) id observer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) ASNotificationName name;

@property (nonatomic, strong) id object;
@property (nonatomic, strong) NSDictionary *userInfo;

-(instancetype) initObserver:(id) _observer selector:(SEL) _selector name:(ASNotificationName) _name object:(id) _object;


@end
