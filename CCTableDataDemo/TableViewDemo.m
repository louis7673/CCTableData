//
//  TableViewDemo.m
//  CCTableDataDemo
//
//  Created by Alex Martin on 2/18/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "TableViewDemo.h"
#import "CCTableData.h"
#import "CCTableViewController.h"

@interface TableViewDemo ()

@property CCTableData *data;
@property NSInteger tapMeCount;

@end

@implementation TableViewDemo

#define kCellPadding 10.0

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"TableView Demo"];
    self.tapMeCount = 0;
    
    // Create the table data here for our demo purposes.
    // In a real application, this could be created anywhere- even in a completely different class, then passed to this one on init.
    
    // Create the first section
    CCTableCell *firstCell = [CCTableCell createWithTitle:@"I'm the first!" selected:^{
        [[[UIAlertView alloc] initWithTitle:@"Tapped"
                                    message:@"Tapped the first cell!"
                                   delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil] show];
    }];
    CCTableCell *secondCell = [CCTableCell createWithTitle:@"I'm the second :(" selected:nil];
    CCTableSection *firstSection = [CCTableSection createWithTitle:@"First Section" andCells:@[firstCell, secondCell]];
    
    // Show some different cell types
    CCTableCell *discloseCell = [CCTableCell createWithTitle:@"I disclose things" andAccessory:UITableViewCellAccessoryDisclosureIndicator selected:nil];
    CCTableCell *checkCell = [CCTableCell createWithTitle:@"I am checked!" andAccessory:UITableViewCellAccessoryCheckmark selected:^{
        CCTableCell *cell = [[self.data getSectionAtIndex:1] getCellAtIndex:1];
        if (cell.accessory == UITableViewCellAccessoryCheckmark) {
            cell.accessory = UITableViewCellAccessoryNone;
            cell.title = @"I am unchecked...";
        } else {
            cell.accessory = UITableViewCellAccessoryCheckmark;
            cell.title = @"I am checked!";
        }
        [self.tableView reloadData];
    }];
    CCTableCell *inputCell = [CCTableCell createInputWithTitle:@"Type in me!" secureText:false returnTapped:^(NSString *text) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Message" message:text delegate:nil cancelButtonTitle:@"Got it!" otherButtonTitles:nil, nil];
        [al show];
    }];
    CCTableSection *secondSection = [CCTableSection createWithTitle:nil andCells:@[discloseCell, checkCell, inputCell]];
    
    CCTableCell *subCell = [CCTableCell createWithTitle:@"I'm a title!" andSubtitle:@"And I'm a subtitle..." selected:nil];
    CCTableCell *tapMeCell = [CCTableCell createWithTitle:@"Tap Me!" ofStyle:UITableViewCellStyleSubtitle selected:^{
        self.tapMeCount ++;
        [[[self.data getSectionAtIndex:2] getCellAtIndex:1] setSubtitle:[NSString stringWithFormat:@"I've been tapped %i time(s)!", self.tapMeCount]];
        [self.tableView reloadData];
    }];
    CCTableCell *altViewCell = [CCTableCell createWithTitle:@"Dynamic views!" selected:^{
        CCTableViewController *dynamicView = [CCTableViewController createGroupedWithTitle:@"Dynamic View!"];
        CCTableCell *coolCell = [CCTableCell createWithTitle:@"This is a dynamic view!"];
        CCTableCell *detailCell = [CCTableCell createWithTitle:@"It supports all of CCTableData" andSubtitle:@"...but is generated on the fly!" selected:nil];
        CCTableCell *doneCell = [CCTableCell createWithTitle:@"I'm done here." selected:^{
            [dynamicView.navigationController popViewControllerAnimated:true];
        }];
        CCTableSection *altSection = [CCTableSection createWithTitle:nil andCells:@[coolCell, detailCell]];
        CCTableSection *altSection2 = [CCTableSection createWithTitle:nil andCells:@[doneCell]];
        CCTableData *altData = [CCTableData createWithSections:@[altSection, altSection2]];
        [dynamicView setTableData:altData];
        [self.navigationController pushViewController:dynamicView animated:true];
    }];
    CCTableSection *thirdSection = [CCTableSection createWithTitle:@"Third Section" andCells:@[subCell, tapMeCell, altViewCell]];

    CCTableCell *multilineCell = [CCTableCell createWithTitle:
            @"Multiline text, there is just a ton of text in here to demonstrate that we can have multiple lines in a single cell, useful to display notes in the contacts app for example"];
    multilineCell.isMultilineCell = YES;
    multilineCell.cellFont = [UIFont systemFontOfSize:14.0];
    CCTableSection *fourthSection = [CCTableSection createWithTitle:@"Fourth Section" andCells:@[multilineCell]];

    // Add the cells to the table model
    self.data = [CCTableData createWithSections:@[firstSection, secondSection, thirdSection, fourthSection]];
}

#pragma mark - Table view data source

// Then, for the data source methods and callbacks, we basically just hook them up to the CCTableData object.
// In most cases, we can accomplish with a single line what used to take a fair amount of work to do.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data getSectionAtIndex:section].cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.data createCellForIndexPath:indexPath withReuseIdentifier:@"cell" onTable:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.data selectCellAtIndexPath:indexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.data getSectionAtIndex:section].title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat result = [super tableView:tableView heightForRowAtIndexPath:indexPath];
    CCTableSection *section = [[self.data sections] objectAtIndex:(NSUInteger) indexPath.section];
    CCTableCell *cell = [[section cells] objectAtIndex:(NSUInteger)indexPath.row];
    // multiline cell
    if (cell.isMultilineCell) {
        NSDictionary *attributes = @{NSFontAttributeName:cell.cellFont};
        CGRect rect = [cell.title boundingRectWithSize:CGSizeMake(tableView.frame.size.width, MAXFLOAT)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:attributes
                                                        context:nil];
        result = rect.size.height + (kCellPadding * 2);
    }
    return result;
}

@end
