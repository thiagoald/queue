//
//  atrasoviewControllwe.m
//  queueApp
//
//  Created by joma on 31/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "atrasoviewControllwe.h"

@implementation atrasoviewControllwe

- (void)viewDidLoad {
	[super viewDidLoad];
	self.localList = [[NSMutableArray alloc] initWithObjects:@
								 "10 min",@"20 min",@"30 min",@"40 min",@"50 min",@"60 min", nil];
	
	self.picker.delegate = self;
	self.picker.dataSource = self;
	[self.picker reloadAllComponents];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [self.localList count];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [self.localList objectAtIndex:row];
}

@end
