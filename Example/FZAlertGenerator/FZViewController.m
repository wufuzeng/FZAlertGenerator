//
//  FZViewController.m
//  FZAlertGenerator
//
//  Created by wufuzeng on 07/25/2019.
//  Copyright (c) 2019 wufuzeng. All rights reserved.
//

#import "FZViewController.h"

#import <FZAlertGenerator.h>

@interface FZViewController ()

@end

@implementation FZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    // title
    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:@"Tip"];
    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, 3)];
    
    
    
    // message
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:@"Message Content"];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(4, 7)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 15)];
    
    [FZAlertGenerator makeAlertWithAttributedTitle:alertControllerStr AttributedMessage:alertControllerMessageStr duration:2 position:FZAlertPositionBottom actionTitles:@[@"确定1",@"确定2",@"确定3",@"取消"] actionTitleColors:@[[UIColor yellowColor],[UIColor redColor],[UIColor blackColor],[UIColor blueColor]] actionlHandler:^(UIAlertAction * _Nonnull action, NSInteger index) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
