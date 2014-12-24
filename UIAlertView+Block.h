//
//  UIAlertView+Block.h
//  Test1217
//
//  Created by gongliang on 14/12/24.
//  Copyright (c) 2014年 GL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block) <UIAlertViewDelegate>


/**
 *  alerView Block 
 *  eg: 
 *  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"yes or no"
 *                                                      message:@"yes"
 *                                                     delegate:nil
 *                                            cancelButtonTitle:@"cancel"
 *                                            otherButtonTitles:@"ok", nil];
 *  [alertView clickedButtonBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
 *
 *  }];
 *  [alertView show];
 *
 *  @param block
 */
- (void)clickedButtonBlock:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))block;

- (void)cancelBlock:(void(^)(UIAlertView *alertView))block;

- (void)willPresentBlock:(void(^)(UIAlertView *alertView))block;

- (void)didPresentBlock:(void(^)(UIAlertView *alertView))block;

- (void)willDismissWithButtonIndexBlock:(void(^) (UIAlertView *alertView, NSInteger buttonIndex))block;

- (void)didDismissWithButtonIndexBlock:(void(^) (UIAlertView *alertView, NSInteger buttonIndex))block;

- (void)shouldEnableFirstOtherButton:(BOOL(^) (UIAlertView *alertView))block;

@end
