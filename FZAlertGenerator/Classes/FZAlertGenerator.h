//
//  FZAlertGenerator.h
//  FZAlertGenerator
//
//  Created by 吴福增 on 2019/7/25.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,FZAlertPosition){
    FZAlertPositionCenter = 0,
    FZAlertPositionBottom = 1 << 0
};

NS_ASSUME_NONNULL_BEGIN

@interface FZAlertGenerator : NSObject

+ (void)makeAlertWithTitle:(NSString *_Nullable)title
                   message:(NSString *_Nullable)message
                  duration:(CGFloat)duration;

+ (void)makeAlertWithTitle:(NSString *_Nullable)title
                   message:(NSString *_Nullable)message
                  duration:(CGFloat)duration
                  position:(FZAlertPosition)position;

+ (void)makeAlertWithTitle:(NSString *_Nullable)title
                   message:(NSString *_Nullable)message
                  duration:(CGFloat)duration
                  position:(FZAlertPosition)position
              actionTitles:(NSArray<NSString*>*_Nullable)actionTitles
            actionlHandler:(void(^_Nullable)(UIAlertAction * _Nonnull action,NSInteger index))actionlHandler ;


+ (void)makeAlertWithAttributedTitle:(NSAttributedString *_Nullable)title
                   AttributedMessage:(NSAttributedString *_Nullable)message
                            duration:(CGFloat)duration;

+ (void)makeAlertWithAttributedTitle:(NSAttributedString *_Nullable)title
                   AttributedMessage:(NSAttributedString *_Nullable)message
                            duration:(CGFloat)duration
                            position:(FZAlertPosition)position;

+ (void)makeAlertWithAttributedTitle:(NSAttributedString *_Nullable)title
                   AttributedMessage:(NSAttributedString *_Nullable)message
                            duration:(CGFloat)duration
                            position:(FZAlertPosition)position
                        actionTitles:(NSArray<NSString*>*_Nullable)actions
                   actionTitleColors:(NSArray<UIColor*>*_Nullable)colors
                      actionlHandler:(void(^_Nullable)(UIAlertAction * _Nonnull action,NSInteger index))actionlHandler;

@end

NS_ASSUME_NONNULL_END
