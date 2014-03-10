//
//  CCTableCell.m
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCTableCell.h"

#define defaultReuseID @"cctablecellreuseid"

@implementation CCTableCell

+ (id)createWithTitle:(NSString *)title {
    CCTableCell *cell = [CCTableCell new];
    cell.title = title;
    cell.accessory = UITableViewCellAccessoryNone;
    cell.style = UITableViewCellStyleDefault;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.reuseID = defaultReuseID;
    return cell;
}

+ (id)createWithTitle:(NSString *)title andAccessory:(UITableViewCellAccessoryType)accessory selected:(void(^)(void))callback {
    CCTableCell *cell = [self createWithTitle:title];
    cell.accessory = accessory;
    cell.callbackSelect = callback;
    return cell;
}

+ (id)createWithTitle:(NSString *)title selected:(void(^)(void))callback {
    CCTableCell *cell = [self createWithTitle:title];
    cell.callbackSelect = callback;
    return cell;
}

+ (id)createWithTitle:(NSString *)title ofStyle:(UITableViewCellStyle)style selected:(void(^)(void))callback {
    CCTableCell *cell = [self createWithTitle:title];
    cell.style = style;
    cell.callbackSelect = callback;
    return cell;
}

+ (id)createWithTitle:(NSString *)title andSubtitle:(NSString *)subTitle selected:(void(^)(void))callback {
    CCTableCell *cell = [self createWithTitle:title];
    cell.subtitle = subTitle;
    cell.callbackSelect = callback;
    cell.style = UITableViewCellStyleSubtitle;
    return cell;
}

+ (id)createInputWithTitle:(NSString *)title secureText:(BOOL)secure textChanged:(void (^)(NSString *))callback {
    CCTableCell *cell = [self createWithTitle:title];
    cell.callbackInputTextEdited = callback;
    cell.isSecureTextInput = secure;
    cell.isInputCell = true;
    return cell;
}

+ (id)createInputWithTitle:(NSString *)title secureText:(BOOL)secure returnTapped:(void (^)(NSString *))callback {
    CCTableCell *cell = [self createWithTitle:title];
    cell.callbackInputReturnTapped = callback;
    cell.isSecureTextInput = secure;
    cell.isInputCell = true;
    return cell;
}

static float systemVersion = 0.0; // Querying the OS for its version is slow; cache the result the first time.
- (UITableViewCell *)createTableViewCellWithID:(NSString *)cellID onTableView:(UITableView *)table {
    if (systemVersion == 0.0) systemVersion = [[UIDevice currentDevice] systemVersion].floatValue; // Cache this; it's slow.
    
    if (self.isInputCell) {
        // Set up the input cell
        CCInputCell *input = [CCInputCell createWithIdentifier:[cellID stringByAppendingString:@"-input"] secureTextField:self.isSecureTextInput];
        
        // Set up the input label
        input.label.text = self.title;
        if (systemVersion >= 7.0) [input.label setTextColor:[UIView appearance].tintColor];
        
        // Set up the text view
        input.inputField.placeholder = self.subtitle;
        [input.inputField setClearButtonMode:UITextFieldViewModeWhileEditing];
        
        // Apply callbacks
        if (self.callbackInputTextEdited != nil) [input setCallbackInputTextEdited:self.callbackInputTextEdited];
        if (self.callbackInputReturnTapped != nil) [input setCallbackInputReturnTapped:self.callbackInputReturnTapped];
        return input;
    } else {
        UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:self.style reuseIdentifier:cellID];
        
        cell.textLabel.text = self.title;
        cell.detailTextLabel.text = self.subtitle;
        cell.selectionStyle = self.selectionStyle;
        cell.accessoryType = self.accessory;
        
        // If this is a UITableViewVellValue2 and we're on iOS 7, set the tint color to match the system
        if (self.style == UITableViewCellStyleValue2) {
            if (systemVersion >= 7.0) {
                UIColor *globalTint = [UIView appearance].tintColor;
                cell.textLabel.textColor = globalTint;
            }
        }
        
        return cell;
    }
}

@end
