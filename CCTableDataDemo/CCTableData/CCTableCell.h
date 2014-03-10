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

/*! Create the cell with the specified title and tapped block */
+ (id) createWithTitle:(NSString*)title selected:(void(^)(void))callback;

/*! Create the cell with the specified title, style, and tapped block */
+ (id) createWithTitle:(NSString*)title ofStyle:(UITableViewCellStyle)style selected:(void(^)(void))callback;

/*! Create the cell with the specified title, accessory, and execution block when tapped */
+ (id) createWithTitle:(NSString*)title andAccessory:(UITableViewCellAccessoryType)accessory selected:(void(^)(void))callback;

/*! Create the cell with the title and subtitle */
+ (id) createWithTitle:(NSString*)title andSubtitle:(NSString*)subTitle selected:(void(^)(void))callback;

/*! Create a cell with a field for users to type values into. Fires the specified callback when the text is changed. */
+ (id) createInputWithTitle:(NSString*)title secureText:(BOOL)secure textChanged:(void(^)(NSString * text))callback;

/*! Create a cell with a field for users to type values into. Fires the specified callback when 'Return' on the keyboard is pressed. */
+ (id) createInputWithTitle:(NSString*)title secureText:(BOOL)secure returnTapped:(void(^)(NSString * text))callback;

/*! Create a basic cell with the specified title */
+ (id) createWithTitle:(NSString*)title;

/*! Create a table view cell object from this cell */
- (UITableViewCell*) createTableViewCellWithID:(NSString*)cellID onTableView:(UITableView*)table;

/*! The title of the cell */
@property NSString *title;

/*! The subtitle of the cell (if applicable) */
@property NSString *subtitle;

/*! The reuse identifier used when drawing the cell */
@property NSString *reuseID;

/*! The accessory type for the cell */
@property UITableViewCellAccessoryType accessory;

/*! The style of the cell */
@property UITableViewCellStyle style;

/*! The selection style for the cell */
@property UITableViewCellSelectionStyle selectionStyle;

/*! Specifies whether the cell is an input cell */
@property BOOL isInputCell;

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
