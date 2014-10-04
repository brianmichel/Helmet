//
//  HelmetPlugin.h
//  HelmetPlugin
//
//  Created by Brian Michel on 10/2/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

@import AppKit;

@interface HelmetPlugin : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end