//
//  HelmetPreferences.m
//  Helmet
//
//  Created by Brian Michel on 10/4/14.
//  Copyright (c) 2014 BSM. All rights reserved.
//

#import "HelmetPreferences.h"
#import "HelmetKeys.h"

NSString * const HelmetPreferencesChangedNotificaton = @"HelmetPreferencesChangedNotificaton";

@implementation HelmetPreferences

+ (BOOL)helmetEnabled {
    NSNumber *enabledNumber = [[NSUserDefaults standardUserDefaults] objectForKey:HelmetEnabledKey];
    if (enabledNumber) {
        return [enabledNumber boolValue];
    }
    return NO;
}

+ (BOOL)helmetSetup {
    NSNumber *enabledNumber = [[NSUserDefaults standardUserDefaults] objectForKey:HelmetEnabledKey];
    return enabledNumber != nil;
}

+ (void)setHelmetEnabled:(BOOL)enabled {
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:enabled] forKey:HelmetEnabledKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[self class] postUpdatedNotification];
}

+ (void)postUpdatedNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:HelmetPreferencesChangedNotificaton object:nil];
}

@end
