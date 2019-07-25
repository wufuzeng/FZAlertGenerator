//
//  UIAlertAction+FZAlertGenerator.m
//  FZAlertGenerator
//
//  Created by 吴福增 on 2019/7/25.
//

#import "UIAlertAction+FZAlertGenerator.h"
#import <objc/runtime.h>

@implementation UIAlertAction (FZAlertGenerator)

-(void)setFz_index:(NSInteger)index{
    objc_setAssociatedObject(self,@selector(fz_index),@(index),OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)fz_index{
    NSNumber * number = objc_getAssociatedObject(self, @selector(fz_index));
    return number.integerValue;
}


@end
