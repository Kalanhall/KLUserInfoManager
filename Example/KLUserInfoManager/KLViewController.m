//
//  KLViewController.m
//  KLUserInfoManager
//
//  Created by Kalanhall@163.com on 11/29/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"
#import "KLUserInfoSub.h"
@import KLModel;
@import YKWoodpecker;
#import "KLUserInfoManager.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YKWoodpeckerManager.sharedInstance show];
    });
	// Do any additional setup after loading the view, typically from a nib.
    
    __block NSMutableDictionary *param = @{ @"userid" : @"18888",
                             @"username" : @"Kimee",
                             @"usericon" : @"https:www.kalan.com/1.png"
    }.mutableCopy;
    
    KLUserInfoSub *userInfo = [KLUserInfoSub kl_modelWithDictionary:param];
    
    [KLUserInfoManager.shareManager updateObject:userInfo];
    
    KLUserInfoSub *object = (KLUserInfoSub *)KLUserInfoManager.shareManager.object;
    
    NSLog(@"object: %@", object.username);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        object.username = @"HasChange";
        [KLUserInfoManager.shareManager updateObject:object];
        NSLog(@"object: %@", object.username);
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [KLUserInfoManager.shareManager removeObject];
        NSLog(@"object: %@", @(KLUserInfoManager.shareManager.isExist));
    });
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
