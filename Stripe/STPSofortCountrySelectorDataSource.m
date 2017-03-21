//
//  STPSofortCountrySelectorDataSource.m
//  Stripe
//
//  Created by Ben Guo on 3/20/17.
//  Copyright © 2017 Stripe, Inc. All rights reserved.
//

#import "STPSofortCountrySelectorDataSource.h"

#import "NSArray+Stripe_BoundSafe.h"
#import "STPLocalizationUtils.h"

@interface STPSofortCountrySelectorDataSource()

@property (nonatomic) NSArray<NSString *>*countryCodes;

@property (nonatomic, assign) NSInteger selectedRow;

@end

@implementation STPSofortCountrySelectorDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray *countryCodes = [@[@"AT", @"BE", @"FR", @"DE", @"NL"] mutableCopy];
        [STPLocalizationUtils sortCountryCodesByDisplayName:countryCodes];
        _countryCodes = countryCodes;
        _selectedRow = NSNotFound;
    }
    return self;
}

- (NSString *)title {
    return STPLocalizedString(@"Country", @"Title for country picker section");
}

- (NSInteger)numberOfRows {
    return [self.countryCodes count];
}

- (void)selectRowWithValue:(NSString *)value {
    if (!value) {
        return;
    }
    NSInteger index = [self.countryCodes indexOfObject:value];
    if (index != NSNotFound) {
        self.selectedRow = index;
    }
}

- (NSString *)valueForRow:(NSInteger)row {
    NSString *countryCode = [self.countryCodes stp_boundSafeObjectAtIndex:row];
    return countryCode ?: @"";
}

- (NSString *)titleForRow:(NSInteger)row {
    NSString *displayName;
    NSString *countryCode = [self.countryCodes stp_boundSafeObjectAtIndex:row];
    if (countryCode) {
        NSString *identifier = [NSLocale localeIdentifierFromComponents:@{NSLocaleCountryCode: countryCode}];
        displayName = [[NSLocale autoupdatingCurrentLocale] displayNameForKey:NSLocaleIdentifier value:identifier];
    }
    return displayName ?: @"";
}

- (UIImage *)imageForRow:(__unused NSInteger)row {
    return [UIImage new]; // TODO
}

@end
