//
//  HelmetPreferences.h
//  Helmet
//
//  Created by Brian Michel on 10/4/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

@import Foundation;

extern NSString * const HelmetPreferencesChangedNotificaton;

@interface HelmetPreferences : NSObject

+ (BOOL)helmetEnabled;

+ (BOOL)helmetSetup;

+ (void)setHelmetEnabled:(BOOL)enabled;

@end
