//
//  SplashViewController.m
//  YinFuKa
//
//  Created by lyl on 14-8-4.
//  Copyright (c) 2014年 lyl. All rights reserved.
//

#import "SplashViewController.h" 
#import "MainViewController.h"
#import "AppDelegate.h"
#import <Cordova/CDVViewController.h>
@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *scroll_bg =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scroll_bg.pagingEnabled=YES;
    scroll_bg.showsHorizontalScrollIndicator=NO;
    scroll_bg.showsVerticalScrollIndicator=NO;
    [scroll_bg setUserInteractionEnabled:YES];
    scroll_bg.bounces=NO;//去掉翻页中的白屏
    
    NSMutableArray *imgSoure =[NSMutableArray arrayWithCapacity:0]; 
    if (DEVICE_IS_IPHONE4) {
        [imgSoure addObject:@"splash_1"];
        [imgSoure addObject:@"splash_2"];
        [imgSoure addObject:@"splash_3"];
        [imgSoure addObject:@"splash_4"];
        NSLog(@"exec one 480---------------------------------------");
    }else if(DEVICE_IS_IPHONE5){
        [imgSoure addObject:@"splash_1-568h@2x"];
        [imgSoure addObject:@"splash_2-568h@2x"];
        [imgSoure addObject:@"splash_3-568h@2x"];
        [imgSoure addObject:@"splash_4-568h@2x"];
        
        NSLog(@"exec one 568---------------------------------------");
    }else if(DEVICE_IS_IPHONE6){
        [imgSoure addObject:@"splash_1-667h@2x"];
        [imgSoure addObject:@"splash_2-667h@2x"];
        [imgSoure addObject:@"splash_3-667h@2x"];
        [imgSoure addObject:@"splash_4-667h@2x"];
   
         NSLog(@"exec one 667---------------------------------------");
    }else if(DEVICE_IS_IPHONE6plugs){
        [imgSoure addObject:@"splash_1-736h@3x"];
        [imgSoure addObject:@"splash_2-736h@3x"];
        [imgSoure addObject:@"splash_3-736h@3x"];
        [imgSoure addObject:@"splash_4-736h@3x"];
        
         NSLog(@"exec one 736---------------------------------------");
    }
    int x=0,j=0;
    for (NSString *itemStr in imgSoure) {
        UIImage *imgItem =[UIImage imageNamed:itemStr];
        
        UIImageView *imgViewItem = [[UIImageView alloc]initWithImage:imgItem];
    
        [imgViewItem setUserInteractionEnabled:YES];
        imgViewItem.frame=CGRectMake(x, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        //imgViewItem.contentMode=UIViewContentModeScaleAspectFit;
        
        [scroll_bg addSubview:imgViewItem];
        x=x+SCREEN_WIDTH;
        
        if (j==imgSoure.count-2||j==imgSoure.count-1) {
            //添加监听
            UITapGestureRecognizer *tapLinster =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(controlClick:)];
            [tapLinster setCancelsTouchesInView:YES];
            [imgViewItem addGestureRecognizer:tapLinster];
        }
        
        
        j++;
    }
    scroll_bg.contentSize=CGSizeMake(imgSoure.count>0?x:SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:scroll_bg];
  
    
}
-(void)controlClick:(UITapGestureRecognizer *)obj{
    CDVViewController *customerVC =[[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    AppDelegate *delegate =[UIApplication sharedApplication].delegate;
    delegate.viewController =customerVC;
    [[[UIApplication sharedApplication].windows objectAtIndex:0] setRootViewController:customerVC];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (IBAction)btnRegister:(id)sender {
//    UserRegisterViewController *uesrRegVC =[[UserRegisterViewController alloc]initWithNibName:@"UserRegister" bundle:nil];
//    UINavigationController *uesrRegNav =[[UINavigationController alloc]initWithRootViewController:uesrRegVC];
//    
//    [self presentModalViewController:uesrRegNav animated:YES];
//}
//
//- (IBAction)btnLogin:(id)sender {
//    UserLoginViewController *uesrLoginVC =[[UserLoginViewController alloc]initWithNibName:@"UserLogin" bundle:nil];
//    UINavigationController *userLoginNav =[[UINavigationController alloc]initWithRootViewController:uesrLoginVC];
//
//    [self presentModalViewController:userLoginNav animated:YES];
//}
@end
