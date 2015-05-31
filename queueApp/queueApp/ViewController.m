//
//  ViewController.m
//  queueApp
//
//  Created by joma on 30/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "ViewController.h"
#import "TimerAtual.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *CPFField;

@end

extern NSString *email;
extern NSString *CPF;

@implementation ViewController

- (void)viewDidLoad {
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = CGPointMake(self.view.center.x, 1.3 * self.view.center.y);
    [self.view addSubview:loginButton];
    //[self BUTAO:self];

    self.navigationController.navigationBar.hidden = YES;
    //self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0/255.0 green:113.0/255.0 blue:115.0/255.0 alpha:1];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)BUTAO:(id)sender
{
    if (FBSDKAccessTokenDidChangeNotification) {
        CPF = self.CPFField.text;
        email = @"Exames";
        NSLog(@"CPF Armazenado : %@", CPF);
        [self prepare];
    }
    
}
-(void)prepare
{
     NSLog(@"vrsbsr");
    UIViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"ExamList"];
    [self.navigationController pushViewController:view1 animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
