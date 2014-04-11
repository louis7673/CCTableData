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

/**
 *  Create a CCTableData model with the specified sections
 *
 *  @param sections The sections to add upon creating the model
 *
 *  @return The created model
 */
+ (id) createWithSections:(NSArray*)sections;

/**
 *  Create a blank CCTableData model
 *
 *  @return The created model
 */
+ (id) create;

/**
 *  Add the specified section to the model
 *
 *  @param section The created model
 */
- (void) addSection:(CCTableSection*)section;

/**
 *  Remove the section at the specified index
 *
 *  @param index The index of the section
 */
- (void) removeSectionAtIndex:(NSInteger)index;

/**
 *  Replace the section at the specified index with the specified section
 *
 *  @param index   The index of the section we want to remove
 *  @param section The section to insert at the specified index
 */
- (void) replaceSectionAtIndex:(NSInteger)index withSection:(CCTableSection *)section;

/**
 *  Return the section at the specified index
 *
 *  @param index The index of the section we are interested in
 *
 *  @return The section model
 */
- (CCTableSection*) getSectionAtIndex:(NSInteger)index;

/**
 *  Get the cell for the specified index path
 *
 *  @param path The NSIndexPath describing the path to the cell
 *
 *  @return The cell model at the specified index
 */
- (CCTableCell*) getCellForIndexPath:(NSIndexPath*)path;

/**
 *  Get the index path for the specified cell
 *
 *  @param searchCell The cell to search for
 *
 *  @return The index path that the cell is located at
 */
- (NSIndexPath*) getIndexPathForCell:(CCTableCell*)searchCell;

/**
 *  Get a safe reference to a cell, useful from within blocks. This should prevent strong retain cycles from ocurring.
 *
 *  @param searchCell The cell to get a reference for
 *
 *  @return A safe reference to the cell.
 */
- (CCTableCell*) getSafeReferenceToCell:(CCTableCell*)searchCell;

/**
 *  Create a cell for the specified index path
 *
 *  @param path    The index path describing the path to the cell
 *  @param reuseID The Cell Reuse Identifier to use for the cell
 *  @param table   The UITableView to create the cell on
 *
 *  @return The created UITableViewCell
 */
- (UITableViewCell*) createCellForIndexPath:(NSIndexPath*)path withReuseIdentifier:(NSString*)reuseID onTable:(UITableView*)table;

/**
 *  Fire the 'highlighted' callback for the cell at the specified path
 *
 *  @param indexPath The index path to run the callback for
 */
- (void) highlightCellAtIndexPath:(NSIndexPath*)indexPath;

/**
 *  Fire the 'selected' callback for the cell at the specified path
 *
 *  @param indexPath The index path to run the callback for
 */
- (void) selectCellAtIndexPath:(NSIndexPath*)indexPath;

/*! The sections contained in the model */
@property NSMutableArray *sections;

/*! The title to display on the UITableViewController */
@property NSString *title;

@end
