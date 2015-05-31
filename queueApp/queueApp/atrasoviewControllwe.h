//
//  atrasoviewControllwe.h
//  queueApp
//
//  Created by joma on 31/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface atrasoviewControllwe : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property NSMutableArray *localList;

@end
