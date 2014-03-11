//
//  CCInputCell.h
//  CCTableDataDemo
//
//  Created by Alex Martin on 2/19/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCInputCell : UITableViewCell <UITextFieldDelegate>

/*! Create the CCInputCell with the specified identifier */
+ (id) createWithIdentifier:(NSString*)identifier secureTextField:(BOOL)secureText;

/*! Create the cell with the specified title */
+ (id) createWithTitle:(NSString*)title;

/*! Create the cell with secured text input and the specified title */
+ (id) createSecuredWithTitle:(NSString*)title;

/*! Create a blank input cell */
+ (id) create;

/*! The input text field */
@property UITextField *inputField;

/*! The label for the text input */
@property UILabel *label;

/*! The callback to fire when the text is editied */
@property (copy) void (^callbackInputTextEdited)(NSString *text);

/*! The callback to fire when return is tapped */
@property (copy) void (^callbackInputReturnTapped)(NSString *text);

@end
