//
//  NSViewController+HeaderLocker.h
//  HeaderLocker
//
//  Created by Brian Michel on 10/4/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

@import Cocoa;

@interface NSViewController (HeaderLocker)

- (void)hl_setDocument:(id)document;

- (void)hl_setTextView:(NSTextView *)hl_editingTextView;

- (NSTextView *)hl_EditingTextView;

@end
