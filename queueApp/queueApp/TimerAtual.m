//
//  TimerAtual.m
//  queueApp
//
//  Created by Luiz Henrique on 30/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "TimerAtual.h"

@interface TimerAtual ()

@end

@implementation TimerAtual

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Deslogar:(id)sender {
    [[self navigationController]popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
