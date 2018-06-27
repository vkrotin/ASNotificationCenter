# ASNotificationCenter

[![Version](https://img.shields.io/cocoapods/v/ASNotificationCenter.svg?style=flat)](http://cocoapods.org/pods/ASNotificationCenter)
[![License](https://img.shields.io/cocoapods/l/ASNotificationCenter.svg?style=flat)](http://cocoapods.org/pods/ASNotificationCenter)
[![Platform](https://img.shields.io/cocoapods/p/ASNotificationCenter.svg?style=flat)](http://cocoapods.org/pods/ASNotificationCenter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage
```objective-c

#import "ASNotificationCenter.h"

// append Notification listener for some class
-(void) someMethod{
    // ...
    [[ASNotificationCenter protectedCenter] addObserver:self selector:@selector(notificationOut:) name:@"someNotification" object:nil];
    // or use short declaration
    [_protectedCenter addObserver:self selector:@selector(notificationSecondOut:) name:@"someSecondNotification" object:nil];
    // ...
}

// Selectors

-(void) notificationOut:(ASNotification *) notification{
   // do something with ASNotification model (ASNotificationName name, id object, NSDictionary *userInfo)
   ...
}

-(void) notificationSecondOut:(ASNotification *) notification{
   // do something with ASNotification model (ASNotificationName name, id object, NSDictionary *userInfo)
   ...
   // you can also unsubscribe from ASNotificationCenter with notification.name
   [[ASNotificationCenter protectedCenter] removeObserver:self name:notification.name object:nil];
}

// Unsubscribe

-(void) dealloc{
// Unsubscribe all notification for this class
    [_protectedCenter removeObserver:self];
}

-(void) someUnsubscribe{
// Unsubscribe single notification for the name in this class
[[ASNotificationCenter protectedCenter] removeObserver:self name:@"someNotification" object:nil];
}
                    
```

## Requirements

## Installation

ASNotificationCenter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ASNotificationCenter"
```

## Author

Aleksey Anisimov, vkrotin.ios@gmail.com

## License

ASNotificationCenter is available under the MIT license. See the LICENSE file for more info.
