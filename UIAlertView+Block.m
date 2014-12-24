//
//  UIAlertView+Block.m
//  Test1217
//
//  Created by gongliang on 14/12/24.
//  Copyright (c) 2014年 GL. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static const void *clickedButtonBlockKey = &clickedButtonBlockKey;
static const void *cancelBlockKey = &cancelBlockKey;
static const void *willPresentBlockKey = &willPresentBlockKey;
static const void *didPresentBlockKey = &didPresentBlockKey;
static const void *willDisMissWithButtonBlockKey = &willDisMissWithButtonBlockKey;
static const void *didDisMissWithButtonBlockkKey = &didDisMissWithButtonBlockkKey;
static const void *shouldEnableFirstOtherButtonBlockKey = &shouldEnableFirstOtherButtonBlockKey;

@implementation UIAlertView (Block)

- (void)clickedButtonBlock:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))block {
    self.delegate = self;
    objc_setAssociatedObject(self, clickedButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)cancelBlock:(void(^)(UIAlertView *alertView))block {
    self.delegate = self;
    objc_setAssociatedObject(self, cancelBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)willPresentBlock:(void(^)(UIAlertView *alertView))block {
    self.delegate = self;
    objc_setAssociatedObject(self, willPresentBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)didPresentBlock:(void(^)(UIAlertView *alertView))block {
    self.delegate = self;
    objc_setAssociatedObject(self, didPresentBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)willDismissWithButtonIndexBlock:(void(^) (UIAlertView *alertView, NSInteger buttonIndex))block {
    self.delegate = self;
    objc_setAssociatedObject(self, willDisMissWithButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)didDismissWithButtonIndexBlock:(void(^) (UIAlertView *alertView, NSInteger buttonIndex))block {
    self.delegate = self;
    objc_setAssociatedObject(self, didDisMissWithButtonBlockkKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)shouldEnableFirstOtherButton:(BOOL(^) (UIAlertView *alertView))block {
    self.delegate = self;
    objc_setAssociatedObject(self, shouldEnableFirstOtherButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^clickedButtonBlock)(UIAlertView *alertView, NSInteger buttonIndex) = objc_getAssociatedObject(self, clickedButtonBlockKey);
    if (clickedButtonBlock) {
        clickedButtonBlock(alertView, buttonIndex);
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    void (^cancelBlock)(UIAlertView *alertView) = objc_getAssociatedObject(self, cancelBlockKey);
    if (cancelBlock) {
        cancelBlock(alertView);
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
    void (^willPresentBlock)(UIAlertView *alertView) = objc_getAssociatedObject(self, willPresentBlockKey);
    if (willPresentBlock) {
        willPresentBlock(alertView);
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    void (^didPresentBlock)(UIAlertView *alertView) = objc_getAssociatedObject(self, didPresentBlockKey);
    if (didPresentBlock) {
        didPresentBlock(alertView);
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    void (^willDismissWithButtonIndexBlock)(UIAlertView *alertView, NSInteger buttonIndex) = objc_getAssociatedObject(self, willDisMissWithButtonBlockKey);
    if (willDismissWithButtonIndexBlock) {
        willDismissWithButtonIndexBlock(alertView, buttonIndex);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    void (^didDismissWithButtonIndexBlock)(UIAlertView *alertView, NSInteger buttonIndex) = objc_getAssociatedObject(self, didDisMissWithButtonBlockkKey);
    if (didDismissWithButtonIndexBlock) {
        didDismissWithButtonIndexBlock(alertView, buttonIndex);
    }
}

// Called after edits in any of the default fields added by the style
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    BOOL (^shouldEnableFirstOtherButtonBlock)(UIAlertView *alertView) = objc_getAssociatedObject(self, shouldEnableFirstOtherButtonBlockKey);
    if (shouldEnableFirstOtherButtonBlock) {
        return shouldEnableFirstOtherButtonBlock(alertView);
    }
    return NO;
}

@end
