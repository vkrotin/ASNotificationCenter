//
//  ASViewController.m
//  ASNotificationCenter
//
//  Created by Aleksey Anisimov on 03/16/2017.
//  Copyright (c) 2017 Aleksey Anisimov. All rights reserved.
//

#import "ASViewController.h"
#import "ASNotificationCenter.h"

@interface ASViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ASViewController

-(void) dealloc{
    [_protectedCenter removeObserver:self name:@"notificationSomeText" object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[ASNotificationCenter protectedCenter] addObserver:self selector:@selector(notificationSomeText:) name:@"notificationSomeText" object:nil];
    
    [_protectedCenter addObserver:self selector:@selector(singleAction:) name:@"notifSingle" object:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) notificationSomeText:(ASNotifiation *) notification{
    
    NSDictionary *receiveObj = notification.object;
    
    _textView.text = receiveObj[@"someText"];
    self.view.backgroundColor = receiveObj[@"someColor"];
    
}

-(void) singleAction:(ASNotifiation *) notification{
    _textView.text = [NSString stringWithFormat:@"%@ append: %@", _textView.text, notification.object];
    [[ASNotificationCenter protectedCenter] removeObserver:self name:@"notifSingle" object:nil];
    [[ASNotificationCenter protectedCenter] removeObserver:self name:notification.name object:nil];
}

@end
