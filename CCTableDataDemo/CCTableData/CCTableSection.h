//
//  CCTableSection.h
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTableCell.h"

@interface CCTableSection : NSObject

/**
 *  Create a blank CCTableSection model
 *
 *  @return The created section model
 */
+ (id) create;

/**
 *  Create a blank CCTableSection model with the specified title
 *
 *  @param title The title for the section
 *
 *  @return The created section model
 */
+ (id) createWithTitle:(NSString*)title;

/**
 *  Create a CCTableSection model with the specified title and cells
 *
 *  @param title The title for the section
 *  @param cells The cells for the section
 *
 *  @return The created section model
 */
+ (id) createWithTitle:(NSString*)title andCells:(NSArray*)cells;

/**
 *  Add a cell to the model
 *
 *  @param cell The cell to add to the model
 */
- (void) addCell:(CCTableCell*)cell;

/**
 *  Remove the cell at the specified index
 *
 *  @param index The index path describing the cell to remove
 */
- (void) removeCellAtIndex:(NSInteger)index;

/**
 *  Replace the cell at the specified index with the specified cell
 *
 *  @param index The index to remove
 *  @param cell  The cell to insert at the index specified
 */
- (void) replaceCellAtIndex:(NSInteger)index withCell:(CCTableCell*)cell;

/**
 *  Return the cell at the specified index
 *
 *  @param index The index to search for
 *
 *  @return The cell model at the specified index
 */
- (CCTableCell*) getCellAtIndex:(NSInteger)index;

/*! The title for the section */
@property NSString *title;

/*! The footer text for the section */
@property NSString *footer;

/*! The cells in the section */
@property NSMutableArray *cells;

@end
