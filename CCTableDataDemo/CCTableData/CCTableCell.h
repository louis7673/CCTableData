//
//  CCTableCell.h
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCInputCell.h"

@interface CCTableCell : NSObject

/**
 *  Create the cell with the specified title and selected block
 *
 *  @param title    The title for the cell
 *  @param callback The callback to fire when the cell is selected
 *
 *  @return The created cell object
 */
+ (id) createWithTitle:(NSString*)title selected:(void(^)(void))callback;

/**
 *  Create the cell with the specified title, style, and selected block
 *
 *  @param title    The title for the cell
 *  @param style    The style of the cell
 *  @param callback The callback to fire when the cell is selected
 *
 *  @return The created cell object
 */
+ (id) createWithTitle:(NSString*)title ofStyle:(UITableViewCellStyle)style selected:(void(^)(void))callback;

/**
 *  Create the cell with the specified title, accessory, and block when selected
 *
 *  @param title     The title for the cell
 *  @param accessory The accessory for the cell
 *  @param callback  The callback to fire when the cell is selected
 *
 *  @return The created cell object
 */
+ (id) createWithTitle:(NSString*)title andAccessory:(UITableViewCellAccessoryType)accessory selected:(void(^)(void))callback;

/**
 *  Create the cell with the title and subtitle. This defaults the cell to the 'UICellStyleSubtitle' style
 *
 *  @param title    The title for the cell
 *  @param subTitle The subtitle for the cell
 *  @param callback The callback to fire when the cell is selected
 *
 *  @return The created cell object
 */
+ (id) createWithTitle:(NSString*)title andSubtitle:(NSString*)subTitle selected:(void(^)(void))callback;

/**
 *  Create a cell with a field for users to type values into
 *
 *  @param title    The title for the cell
 *  @param secure   Whether the text field should be secure
 *  @param callback The callback to fire when the text has changed
 *
 *  @return The created cell object
 */
+ (id) createInputWithTitle:(NSString*)title secureText:(BOOL)secure textChanged:(void(^)(NSString * text))callback;

/**
 *  Create a cell with a field for users to type values into
 *
 *  @param title    The title for the cell
 *  @param secure   Whether the text field should be secure
 *  @param callback The callback to fire when the user taps the 'Return' key on the keyboard
 *
 *  @return The created cell object
 */
+ (id) createInputWithTitle:(NSString*)title secureText:(BOOL)secure returnTapped:(void(^)(NSString * text))callback;

/**
 *  Create a basic cell with the specified title
 *
 *  @param title The title for the cell
 *
 *  @return The created cell object
 */
+ (id) createWithTitle:(NSString*)title;

/**
 *  Create a table view cell object from this cell
 *
 *  @param cellID The Cell Identifier to use when creating the object
 *  @param table  The table view to create the cell on
 *
 *  @return The created UITableViewCell object
 */
- (UITableViewCell*) createTableViewCellWithID:(NSString*)cellID onTableView:(UITableView*)table;

/*! The title of the cell */
@property NSString *title;

/*! The subtitle of the cell (if applicable) */
@property NSString *subtitle;

/*! The value to put in the inputField initially */
@property NSString *initialInputValue;

/*! The type of keyboard to show with the input (if applicable) */
@property UIKeyboardType keyboardType;

/*! The type of Autocorrection to use with the input (if applicable) */
@property UITextAutocorrectionType autocorrectionType;

/*! The type of Autocapitalization to use with the input (if applicable) */
@property UITextAutocapitalizationType autocapitalizationType;

/*! The reuse identifier used when drawing the cell */
@property NSString *reuseID;

/*! The accessory type for the cell */
@property UITableViewCellAccessoryType accessory;

/*! The style of the cell */
@property UITableViewCellStyle style;

/*! The font the main text label will be rendered in */
@property UIFont *cellFont;

/*! The selection style for the cell */
@property UITableViewCellSelectionStyle selectionStyle;

/*! Specifies whether the cell is an input cell */
@property BOOL isInputCell;

/*! Specifies whether the cell should hold multiple lines */
@property BOOL isMultilineCell;

/*! Specify whether the input is secure text */
@property BOOL isSecureTextInput;

/*! The callback to execute when the cell is selected */
@property (copy) void (^callbackSelect)(void);

/*! The callback to execute when the cell is highlighted */
@property (copy) void (^callbackHighlighted)(void);

/*! The callback to execute when the text input field on an input cell is edited */
@property (copy) void (^callbackInputTextEdited)(NSString *text);

/*! The callback to execute when the text input field has 'return' pressed */
@property (copy) void (^callbackInputReturnTapped)(NSString *text);


@end
