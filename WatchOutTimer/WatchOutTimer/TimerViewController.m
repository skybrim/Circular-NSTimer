//
//  TimerViewController.m
//  WatchOutTimer
//
//  Created by wiley on 2019/12/3.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "TimerViewController.h"
#import "NSTimer+WOTTimerBlocksSupport.h"
#import "WOTProxy.h"

@interface TimerViewController ()

@property (nonatomic, strong, readwrite) NSTimer *timer;

@end

@implementation TimerViewController

- (void)dealloc {
    [_timer invalidate];
    NSLog(@"TimerViewController delloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //方式 1
    __weak TimerViewController *weakSelf = self;
    _timer = [NSTimer w_scheduledTimerWithTimeInterval:3.0f repeats:YES block:^{
        TimerViewController *strongSelf = weakSelf;
        [strongSelf doSomething];
    }];
    
    //方式 2
//    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:[WOTProxy proxyWithTarget:self] selector:@selector(doSomething) userInfo:nil repeats:YES];
}

- (void)doSomething {
    NSLog(@"do something");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
