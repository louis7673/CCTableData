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

/*! Create a blank CCTableSection model */
+ (id) create;

/*! Create a blank CCTableSection model with the specified title */
+ (id) createWithTitle:(NSString*)title;

/*! Create a CCTableSection model with the specified title and cells */
+ (id) createWithTitle:(NSString*)title andCells:(NSArray*)cells;

/*! Add a cell to the model */
- (void) addCell:(CCTableCell*)cell;

/*! Remove the cell at the specified index */
- (void) removeCellAtIndex:(NSInteger)index;

/*! Replace the cell at the specified index with the specified cell */
- (void) replaceCellAtIndex:(NSInteger)index withCell:(CCTableCell*)cell;

/*! Return the cell at the specified index */
- (CCTableCell*) getCellAtIndex:(NSInteger)index;

/*! The title for the section */
@property NSString *title;

/*! The footer text for the section */
@property NSString *footer;

/*! The cells in the section */
@property NSMutableArray *cells;

@end
