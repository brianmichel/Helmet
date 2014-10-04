//
//  NSViewController+Helmet.h
//  Helmet
//
//  Created by Brian Michel on 10/4/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

@import Cocoa;

/**
 *  IDEEditor is ultimately an NSViewController
 *  
 *  So we add a category here in order to enable custom behavior.
 */
@interface NSViewController (Helmet)

/**
 *  Used for swizzling to get access to the document.
 *
 *  @param document The IDESourceCodeDocument representation of a source file.
 */
- (void)hl_setDocument:(id)document;

/**
 *  Used for swizzling to get access to the text view
 *
 *  @param hl_editingTextView The underlying source editor view for the file.
 */
- (void)hl_setTextView:(NSTextView *)hl_editingTextView;

/**
 *  The getter for the editing text view addition.
 *
 *  @return The underlying source editor view for the file.
 */
- (NSTextView *)hl_EditingTextView;

@end
