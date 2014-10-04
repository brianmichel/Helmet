//
//  NSViewController+HeaderLocker.m
//  HeaderLocker
//
//  Created by Brian Michel on 10/4/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

#import <objc/runtime.h>
#import "NSViewController+HeaderLocker.h"

void * HLEditingTextViewKey = &HLEditingTextViewKey;

@implementation NSViewController (HeaderLocker)

- (void)hl_setDocument:(id)document {
    [self hl_setDocument:document];
    [self updateEditibilityForDocument:[self valueForKey:@"_document"] andTextView:self.hl_EditingTextView];
}

- (void)hl_setTextView:(NSTextView *)textView {
    [self hl_setTextView:textView];
    self.hl_EditingTextView = textView;
    [self updateEditibilityForDocument:[self valueForKey:@"_document"] andTextView:self.hl_EditingTextView];
}

- (void)setHl_EditingTextView:(NSTextView *)hl_EditingTextView {
    objc_setAssociatedObject(self, HLEditingTextViewKey, hl_EditingTextView, OBJC_ASSOCIATION_ASSIGN);
}

- (NSTextView *)hl_EditingTextView {
    return objc_getAssociatedObject(self, HLEditingTextViewKey);
}

- (void)updateEditibilityForDocument:(id)document andTextView:(id)textView {
    @try {
        id editorDocument = document;
        id editorTextView = textView;
        
        if ([editorDocument isKindOfClass:NSClassFromString(@"IDESourceCodeDocument")] && [editorTextView isKindOfClass:[NSTextView class]]) {
            NSTextView *castTextView = (NSTextView *)editorTextView;
            NSURL *fileURL = [editorDocument valueForKeyPath:@"filePath.fileURL"];
            BOOL editable = [self filePathIsEditable:fileURL];
            castTextView.editable = editable;
            NSLog(@"PATH: %@ - EDITABLE: %@", [fileURL relativePath], castTextView.editable ? @"YES" : @"NO");
        }
        
    }
    @catch (NSException *exception) {
        NSLog(@"[HL] %@", exception);
    }
}

- (BOOL)filePathIsEditable:(NSURL *)filePath {
    NSString *absolutePath = [filePath relativePath];
    if ([absolutePath hasPrefix:@"/Applications/Xcode.app/"]) {
        return NO;
    }
    return YES;
}

@end
