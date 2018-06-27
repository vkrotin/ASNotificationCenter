//
//  ASNotifiationObject.m
//  AppSafeNotificationCenter
//
//  Created by Aleksey Anisimov on 16.03.17.
//  Copyright © 2017 Aleksey Anisimov. All rights reserved.
//

#import "ASNotifiation.h"

@implementation ASNotifiation


-(instancetype) initObserver:(id) _observer selector:(SEL) _selector name:(ASNotificationName) _name object:(id) _object{
    self = [super init];
    if (self){
        self.observer = _observer;
        self.selector = _selector;
        self.name = _name;
        self.object = _object;
    }
    
    return self;
}

@end
