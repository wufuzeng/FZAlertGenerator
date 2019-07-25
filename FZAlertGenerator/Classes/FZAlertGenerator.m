//
//  FZAlertGenerator.m
//  FZAlertGenerator
//
//  Created by 吴福增 on 2019/7/25.
//

#import "FZAlertGenerator.h"
#import "UIAlertAction+FZAlertGenerator.h"
@implementation FZAlertGenerator

+ (void)makeAlertWithTitle:(NSString *)title message:(NSString *)message duration:(CGFloat)duration{
    [self makeAlertWithTitle:title message:message duration:duration position:FZAlertPositionCenter];
}

+ (void)makeAlertWithTitle:(NSString *)title message:(NSString *)message duration:(CGFloat)duration position:(FZAlertPosition)position{
    [self makeAlertWithTitle:title message:message duration:duration position:position actionTitles:nil actionlHandler:nil];
}

+ (void)makeAlertWithTitle:(NSString *)title message:(NSString *)message duration:(CGFloat)duration position:(FZAlertPosition)position actionTitles:(NSArray<NSString*>*)actionTitles actionlHandler:(void(^)(UIAlertAction * _Nonnull action,NSInteger index))actionlHandler {
    NSAttributedString * attributedTitle = [[NSAttributedString alloc]initWithString:title];
    NSAttributedString * attributedmessage = [[NSAttributedString alloc]initWithString:message];
    [self makeAlertWithAttributedTitle:attributedTitle AttributedMessage:attributedmessage duration:duration position:position actionTitles:actionTitles actionTitleColors:nil actionlHandler:actionlHandler];
}

+ (void)makeAlertWithAttributedTitle:(NSAttributedString *)title
                   AttributedMessage:(NSAttributedString *)message
                            duration:(CGFloat)duration{
    [self makeAlertWithAttributedTitle:title AttributedMessage:message duration:duration position:FZAlertPositionCenter];
}

+ (void)makeAlertWithAttributedTitle:(NSAttributedString *)title
                   AttributedMessage:(NSAttributedString *)message
                            duration:(CGFloat)duration
                            position:(FZAlertPosition)position{
    [self makeAlertWithAttributedTitle:title AttributedMessage:message duration:duration position:position actionTitles:nil actionTitleColors:nil actionlHandler:nil];
}

+ (void)makeAlertWithAttributedTitle:(NSAttributedString *)title
                   AttributedMessage:(NSAttributedString *)message
                            duration:(CGFloat)duration
                            position:(FZAlertPosition)position
                        actionTitles:(NSArray<NSString*>*)actions
                   actionTitleColors:(NSArray<UIColor*>*)colors
                      actionlHandler:(void(^)(UIAlertAction * _Nonnull action,NSInteger index))actionlHandler {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil
                                                                    message:nil
                                                             preferredStyle:position == FZAlertPositionCenter ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
    [alert setValue:title forKey:@"attributedTitle"];
    [alert setValue:message forKey:@"attributedMessage"];
    BOOL canAutoDismiss = duration > 0.001;
    for (int i = 0; i < actions.count; i++){
        UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
        if ((i == actions.count - 1) && (canAutoDismiss == false)) {
            actionStyle = UIAlertActionStyleCancel;
        }
        UIAlertAction * action = [UIAlertAction actionWithTitle:actions[i] style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
            actionlHandler(action,action.fz_index);
        }];
        action.fz_index = i;
        UIColor *color = i < colors.count ? colors[i] : nil;
        if (@available(iOS 9.0, *)) {
            if (color) {
                [action setValue:color forKey:@"titleTextColor"];
            }
        } else{
            if (color) {
                [action setValue:color forKey:@"_titleTextColor"];
            }
        }
        [alert addAction:action];
    }
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alert animated:YES completion:^{
        if (canAutoDismiss){
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
        }
    }];
}

#pragma mark    ------ private ------
+ (UIViewController *)topViewController{
    UIViewController *topViewController = [[UIApplication sharedApplication].delegate.window rootViewController];
    while (true) {
        if (topViewController.presentedViewController) {
            topViewController = topViewController.presentedViewController;
        } else if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)topViewController topViewController]) {
            topViewController = [(UINavigationController *)topViewController topViewController];
        } else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)topViewController;
            topViewController = tab.selectedViewController;
        } else {
            break;
        }
    }
    return topViewController;
}


@end
