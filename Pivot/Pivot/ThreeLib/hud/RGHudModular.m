//
//  RGHudModular.m
//  FMTest
//
//  Created by RG-IOS-DEV－001 on 15/3/2.
//  Copyright (c) 2015年 Readygo. All rights reserved.
//

#import "RGHudModular.h"


static RGHudModular *RGHud;
@implementation RGHudModular
+ (RGHudModular *)getRGHud
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RGHud = [[RGHudModular alloc] init];
    });
    return RGHud;
}
- (void)showPopHudWithMessage:(NSString *)message inWindow:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView.window];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = message;
    HUD.dimBackground = NO;
    [HUD show:YES];
}
- (void)showPopHudWithMessage:(NSString *)message inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView.window];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = message;
    HUD.dimBackground = NO;
    [HUD show:YES];
 
}

- (void)showAutoHudWithMessageDefault:(NSString *)message
{
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = message;
    //    HUD.dimBackground = NO;
    HUD.userCanTouch = YES;
    HUD.mode = MBProgressHUDModeText;
    //    HUD.margin = 10.f;
    [HUD show:YES];
    [HUD hide:YES afterDelay:2.0];
}

- (void)showAutoHudWithMessage:(NSString *)message inView:(UIView *)containView afterTime:(float)afterTime
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = message;
//    HUD.dimBackground = NO;
    HUD.userCanTouch = YES;
    HUD.mode = MBProgressHUDModeText;
 //    HUD.margin = 10.f;
    [HUD show:YES];
    [HUD hide:YES afterDelay:afterTime];
}
- (void)hidePopHudInView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:YES];
}
- (void)hidePopHudInWindow:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:YES];
}
- (void)showTopHudWithMessage:(NSString *)message inView:(UIView *)containView
{
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView.window];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = message;
    //    HUD.dimBackground = NO;
    HUD.userCanTouch = YES;
    HUD.mode = MBProgressHUDModeText;
    HUD.margin = 10.f;
    HUD.minShowTime = 1.0f;
    HUD.yOffset =-containView.frame.size.height/2+30;
    [HUD show:YES];
    [HUD hide:YES afterDelay:3.0];
}
- (void)showBottomHudWithMessage:(NSString *)message inView:(UIView *)containView
{
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView.window];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = message;
    //    HUD.dimBackground = NO;
    HUD.userCanTouch = YES;
    HUD.mode = MBProgressHUDModeText;
    HUD.margin = 10.f;
    HUD.minShowTime = 1.0f;
    HUD.yOffset =containView.frame.size.height/2-30;
    [HUD show:YES];
    [HUD hide:YES afterDelay:3.0];

}
- (MBProgressHUD *)showProgressHud:(MBProgressHUDMode)mode withMessage:(NSString *)message inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView.window];
    [containView.window addSubview:HUD];
    HUD.mode = mode;
    
    HUD.labelText = message;
    [HUD show:YES];
    return HUD;
}
- (void)showPophudWithImage:(UIImage *)img showMessage:(NSString *)message backColor:(UIColor *)color inView:(UIView *)containView
{
    [MBProgressHUD hideHUDForView:containView.window animated:NO];
    MBProgressHUD* HUD = [[MBProgressHUD alloc] initWithView:containView.window];
    [containView.window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.customView =[[UIImageView alloc] initWithImage:img];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = message;
//    HUD.userCanTouch = YES;//是否可以触摸消失
//    HUD.dimBackground = NO;
    [HUD show:YES];
    [HUD hide:YES afterDelay:3];
}
@end
