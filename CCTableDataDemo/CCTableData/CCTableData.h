//
//  CCTableData.h
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTableSection.h"

@interface CCTableData : NSObject

/*! Create a CCTableData model with the specified sections */
+ (id) createWithSections:(NSArray*)sections;

/*! Create a blank CCTableData model */
+ (id) create;

/*! Add the specified section */
- (void) addSection:(CCTableSection*)section;

/*! Remove the section at the specified index */
- (void) removeSectionAtIndex:(NSInteger)index;

/*! Replace the section at the specified index with the specified section */
- (void) replaceSectionAtIndex:(NSInteger)index withSection:(CCTableSection *)section;

/*! Return the section at the specified index */
- (CCTableSection*) getSectionAtIndex:(NSInteger)index;

/*! Get the cell for the specified index path */
- (CCTableCell*) getCellForIndexPath:(NSIndexPath*)path;

/*! Create a cell for the specified index path */
- (UITableViewCell*) createCellForIndexPath:(NSIndexPath*)path withReuseIdentifier:(NSString*)reuseID onTable:(UITableView*)table;

/*! Fire the 'highlighted' callback for the cell at the specified path */
- (void) highlightCellAtIndexPath:(NSIndexPath*)indexPath;

/*! Fire the 'selected' callback for the cell at the specified path */
- (void) selectCellAtIndexPath:(NSIndexPath*)indexPath;

/*! The sections contained in the model */
@property NSMutableArray *sections;

/*! The title to display on the UITableViewController */
@property NSString *title;

@end
