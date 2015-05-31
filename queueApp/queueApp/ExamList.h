//
//  ExamList.h
//  queueApp
//
//  Created by Luiz Henrique on 30/05/15.
//  Copyright (c) 2015 codecup. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CloudKit;
@interface ExamList : UIViewController {
    CKContainer *_container;
    CKDatabase *_publicDB;
    CKDatabase *_privateDB;
    NSMutableArray *_list;
}

@property (nonatomic, retain, readwrite) NSMutableArray *list;
@property (nonatomic, retain, readwrite) NSMutableArray *horario;

@end
