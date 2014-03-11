//
//  CCTableViewController.h
//  CCTableDataDemo
//
//  Created by Alex Martin on 3/10/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCTableData.h"

@interface CCTableViewController : UITableViewController

/*! Create a view controller instance with the specified data */
+ (CCTableViewController*)createWithTableData:(CCTableData*)data;

/*! Create a view controller instance with the specified title */
+ (CCTableViewController*)createWithTitle:(NSString*)title;

/*! Create a view controller instance with the specified title using the Grouped style */
+ (CCTableViewController*)createGroupedWithTitle:(NSString*)title;

/*! The data model for the table view */
@property CCTableData *tableData;

@end
