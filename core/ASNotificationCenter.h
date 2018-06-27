//
//  ASNotificationCenter.h
//  AppSafeNotificationCenter
//
//  Created by Aleksey Anisimov on 16.03.17.
//  Copyright © 2017 Aleksey Anisimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASNotifiation.h"

#define _protectedCenter [ASNotificationCenter protectedCenter]

@interface ASNotificationCenter : NSObject

@property (class, readonly, strong) ASNotificationCenter *protectedCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(ASNotificationName)aName object:(id)anObject;

- (void)postNotification:(ASNotifiation *)notification;
- (void)postNotificationName:(ASNotificationName)aName object:(id)anObject;
- (void)postNotificationName:(ASNotificationName)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(ASNotificationName)aName object:(id)anObject;


@end
