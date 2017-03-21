//
//  STPSofortSourceInfoDataSource.m
//  Stripe
//
//  Created by Ben Guo on 3/2/17.
//  Copyright © 2017 Stripe, Inc. All rights reserved.
//

#import "STPSofortSourceInfoDataSource.h"

#import "NSArray+Stripe_BoundSafe.h"
#import "STPLocalizationUtils.h"
#import "STPSofortCountrySelectorDataSource.h"
#import "STPTextFieldTableViewCell.h"

@implementation STPSofortSourceInfoDataSource

- (instancetype)initWithSourceParams:(STPSourceParams *)sourceParams {
    self = [super initWithSourceParams:sourceParams];
    if (self) {
        self.title = STPLocalizedString(@"Pay with Sofort", @"Title for form to collect Sofort account info");
        self.cells = @[];
        self.selectorDataSource = [STPSofortCountrySelectorDataSource new];
        NSDictionary *sofortDict = self.sourceParams.additionalAPIParameters[@"sofort"];
        if (sofortDict) {
            [self.selectorDataSource selectRowWithValue:sofortDict[@"country"]];
        }
    }
    return self;
}

- (STPSourceParams *)completeSourceParams {
    STPSourceParams *params = [self.sourceParams copy];
    NSMutableDictionary *additionalParams = [NSMutableDictionary new];
    if (params.additionalAPIParameters) {
        additionalParams = [params.additionalAPIParameters mutableCopy];
    }
    NSMutableDictionary *sofortDict = [NSMutableDictionary new];
    if (additionalParams[@"sofort"]) {
        sofortDict = additionalParams[@"sofort"];
    }
<<<<<<< HEAD
    STPTextFieldTableViewCell *countryCell = [self.cells stp_boundSafeObjectAtIndex:0];
    sofortDict[@"country"] = countryCell.contents;
    additionalParams[@"sofort"] = sofortDict;
    params.additionalAPIParameters = additionalParams;

    NSString *country = params.additionalAPIParameters[@"sofort"][@"country"];
    if (country.length > 0) {
        return params;
    }
    return nil;
=======
    // TODO: country from selection
//    STPTextFieldTableViewCell *countryCell = [self.cells stp_boundSafeObjectAtIndex:0];
//    sofortDict[@"country"] = countryCell.contents;
//    additionalParams[@"sofort"] = sofortDict;
//    params.additionalAPIParameters = additionalParams;
    return params;
>>>>>>> wip
}

@end
