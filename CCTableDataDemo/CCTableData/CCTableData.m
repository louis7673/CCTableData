//
//  CCTableData.m
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCTableData.h"

@implementation CCTableData

+ (id) create {
    CCTableData *data = [CCTableData new];
    data.sections = [NSMutableArray new];
    return data;
}

+ (id)createWithSections:(NSArray *)sections {
    CCTableData *data = [CCTableData new];
    data.sections = [NSMutableArray arrayWithArray:sections];
    return data;
}

- (id) init {
    self = [super init];
    self.sections = [NSMutableArray new];
    return self;
}

- (void)addSection:(CCTableSection *)section {
    [self.sections addObject:section];
}

- (void)removeSectionAtIndex:(NSInteger)index {
    if (self.sections.count > index) [self.sections removeObjectAtIndex:index];
}

- (void)replaceSectionAtIndex:(NSInteger)index withSection:(CCTableSection *)section {
    if (self.sections.count > index) [self.sections replaceObjectAtIndex:index withObject:section];
}

- (CCTableSection *)getSectionAtIndex:(NSInteger)index {
    return (self.sections.count > index) ? [self.sections objectAtIndex:index] : nil;
}

- (CCTableCell *)getCellForIndexPath:(NSIndexPath*)path {
    return [[self getSectionAtIndex:path.section] getCellAtIndex:path.row];
}

- (NSIndexPath *)getIndexPathForCell:(CCTableCell *)searchCell {
    NSIndexPath *path = nil;
    for (int sectionIndex = 0; sectionIndex < self.sections.count; sectionIndex++) {
        CCTableSection *section = [self.sections objectAtIndex:sectionIndex];
        for (int rowIndex = 0; rowIndex < section.cells.count; rowIndex++) {
            CCTableCell *cell = [section.cells objectAtIndex:rowIndex];
            if ([searchCell.title isEqualToString:cell.title] && [searchCell.subtitle isEqualToString:cell.subtitle]) {
                path = [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
                break;
            }
        }
        if (path != nil) break;
    }
    return path;
}

- (CCTableCell *)getSafeReferenceToCell:(CCTableCell *)searchCell {
    NSIndexPath *cellPath = [self getIndexPathForCell:searchCell];
    return cellPath == nil ? nil : [self getCellForIndexPath:cellPath];
}

- (NSInteger)getIndexForSection:(CCTableSection *)searchSection {
    NSInteger index = -1;
    for (int i = 0; i < self.sections.count; i++) {
        CCTableSection *section = [self.sections objectAtIndex:i];
        if ([section.title isEqualToString:searchSection.title] && section.cells.count == searchSection.cells.count) {
            index = i;
            break;
        }
    }
    return index;
}

- (CCTableSection *)getSafeReferenceToSection:(CCTableSection *)searchSection {
    NSInteger index = [self getIndexForSection:searchSection];
    return index == -1 ? nil : [self getSectionAtIndex:index];
}

- (void)highlightCellAtIndexPath:(NSIndexPath *)indexPath {
    CCTableCell *cell = [self getCellForIndexPath:indexPath];
    if (cell != nil && cell.callbackHighlighted != nil) cell.callbackHighlighted();
}

- (void)selectCellAtIndexPath:(NSIndexPath *)indexPath {
    CCTableCell *cell = [self getCellForIndexPath:indexPath];
    if (cell != nil && cell.callbackSelect != nil) cell.callbackSelect();
}

- (UITableViewCell *)createCellForIndexPath:(NSIndexPath *)path withReuseIdentifier:(NSString *)reuseID onTable:(UITableView *)table {
    return [[self getCellForIndexPath:path] createTableViewCellWithID:reuseID onTableView:table];
}

@end
