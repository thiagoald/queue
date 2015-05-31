//
//  cancelviewcontroller.m
//  queueApp
//
//  Created by joma on 31/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "cancelviewcontroller.h"

@implementation cancelviewcontroller


- (void)viewDidLoad {
	[super viewDidLoad];
}

- (IBAction)button:(id)sender {
	[[self navigationController]popViewControllerAnimated:YES];
	[[self navigationController]popViewControllerAnimated:YES];
}

@end
