//
//  ASModalViewController.m
//  ASNotificationCenter
//
//  Created by Aleksey Anisimov on 16.03.17.
//  Copyright © 2017 Aleksey Anisimov. All rights reserved.
//

#import "ASModalViewController.h"
#import "ASNotificationCenter.h"
#import "UIColor+ASRandom.h"

@interface ASModalViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation ASModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButtonTouch:(id)sender {
    [self touchGesture:nil];
    
    [[ASNotificationCenter protectedCenter] postNotificationName:@"notificationSomeText" object:@{@"someText" : _inputTextField.text}];
}

- (IBAction)touchGesture:(id)sender {
    
    [[ASNotificationCenter protectedCenter] postNotificationName:@"notificationSomeColor" object:@{ @"someColor" : [UIColor randomColor]}];
    
   // [_protectedCenter postNotificationName:@"notifSingle" object:_inputTextField.text];
    
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
