//
//  CCTableViewController.m
//  CCTableDataDemo
//
//  Created by Alex Martin on 3/10/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCTableViewController.h"

#define cellid @"tableviewcell"

@interface CCTableViewController ()

@end

@implementation CCTableViewController

#pragma mark - Public Methods

+ (CCTableViewController *)createWithTableData:(CCTableData *)data {
    CCTableViewController *table = [CCTableViewController new];
    table.tableData = data;
    return table;
}

+ (CCTableViewController *)createWithTitle:(NSString *)title {
    CCTableViewController *table = [CCTableViewController new];
    table.navigationItem.title = title;
    return table;
}

+ (CCTableViewController *)createGroupedWithTitle:(NSString *)title {
    CCTableViewController *table = [[CCTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    table.navigationItem.title = title;
    return table;
}

#pragma mark - Private Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.tableData == nil) {
        NSLog(@"ERROR! No CCTableData Defined for view: %@", self);
        [self.navigationController popViewControllerAnimated:true];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.tableData.sections objectAtIndex:section] cells].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.tableData createCellForIndexPath:indexPath withReuseIdentifier:cellid onTable:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CCTableCell *cell = [self.tableData getCellForIndexPath:indexPath];
    if (cell.callbackSelect != nil) cell.callbackSelect();
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    CCTableCell *cell = [self.tableData getCellForIndexPath:indexPath];
    if (cell.callbackHighlighted != nil) cell.callbackHighlighted();
}

@end
