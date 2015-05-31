//
//  tableview.m
//  queueAPPDoctor
//
//  Created by joma on 31/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import "tableview.h"

@implementation tableview


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}


-(UITableViewCell*)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = [[UITableViewCell alloc]init];
	
	cell.textLabel.text = [NSString stringWithFormat:@"hu3"];
	//cell.textLabel.textAlignment = NSTextAlignmentCenter;
	
	return cell;
}

@end
