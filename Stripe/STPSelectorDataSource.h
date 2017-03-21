//
//  STPSelectorDataSource.h
//  Stripe
//
//  Created by Ben Guo on 3/20/17.
//  Copyright © 2017 Stripe, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol STPSelectorDataSource <NSObject>

@property (nonatomic, readonly) NSInteger selectedRow;

- (NSString *)title;
- (NSInteger)numberOfRows;
- (NSString *)valueForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (UIImage *)imageForRow:(NSInteger)row;
- (void)selectRowWithValue:(NSString *)value;

@end
