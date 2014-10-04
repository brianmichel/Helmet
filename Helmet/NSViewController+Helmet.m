//
//  NSViewController+Helmet.m
//  Helmet
//
//  Created by Brian Michel on 10/4/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

#import <objc/runtime.h>
#import "NSViewController+Helmet.h"
#import "HelmetPreferences.h"

void * HLEditingTextViewKey = &HLEditingTextViewKey;

@implementation NSViewController (Helmet)

- (void)hl_setDocument:(id)document {
    [self hl_setDocument:document];
    [self updateEditibility];
}

- (void)hl_setTextView:(NSTextView *)textView {
    [self hl_setTextView:textView];
    self.hl_EditingTextView = textView;
    [self updateEditibility];
}

- (void)setHl_EditingTextView:(NSTextView *)hl_EditingTextView {
    objc_setAssociatedObject(self, HLEditingTextViewKey, hl_EditingTextView, OBJC_ASSOCIATION_ASSIGN);
}

- (NSTextView *)hl_EditingTextView {
    return objc_getAssociatedObject(self, HLEditingTextViewKey);
}

- (void)updateEditibility {
    if ([HelmetPreferences helmetEnabled]) {
        @try {
            id editorDocument = [self valueForKey:@"_document"];
            id editorTextView = self.hl_EditingTextView;
            
            if ([editorDocument isKindOfClass:NSClassFromString(@"IDESourceCodeDocument")] && [editorTextView isKindOfClass:[NSTextView class]]) {
                NSTextView *castTextView = (NSTextView *)editorTextView;
                NSURL *fileURL = [editorDocument valueForKeyPath:@"filePath.fileURL"];
                BOOL editable = [self filePathIsEditable:fileURL];
                castTextView.editable = editable;
            }
            
        }
        @catch (NSException *exception) {
            NSLog(@"[HL] %@", exception);
        }
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
