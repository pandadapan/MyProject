//
//  ViewController.m
//  SXT_TaxiCallAlliance
//
//  Created by ts on 17/5/12.
//  Copyright © 2017年 PAN. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"


@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIImageView *pic;
@property(nonatomic,weak)UIPageControl *page;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
     
    //添加背景图片；
    [self addPic];
    //添加滚动视图
    [self addScrollView];
    
    
    //添加头像
    [self addPhotoBtn:CGRectMake(30, 30, 34, 34) image:@"photo"];
    //添加对话
    [self addContentView];
    
    //显示要去哪里
    [self addMarkView];
    
    
}

//
- (void)addMarkView
{
    UIImageView *markV = [self picForRect:CGRectMake(self.view.center.x, self.view.center.y - 30, 15, 34) image:@"mark"];
    [_pic addSubview:markV];
    
    //对话背景
    UIImageView *backV = [self picForRect:CGRectMake(markV.center.x - 109/2 , markV.frame.origin.y - 17 - 10, 109, 17) image:@"local"];
    [_pic addSubview:backV];
    
    //
   
    
}


//添加对话框
- (void)addContentView
{
    
    
    UIImageView *backView = [self picForRect:CGRectMake(70, 30 + 8, 161, 18) image:@"messageContent"];
    [_pic addSubview:backView];
    //
    UIImageView *muteV= [self picForRect:CGRectMake(5, 5/2, 9, 13) image:@"mute"];
    [backView addSubview:muteV];
    
    //
    UILabel *lab = [self labelForRect:CGRectMake(CGRectGetMaxX(muteV.frame) + 3, 3, backView.frame.size.width - 20, 12) textColor:[UIColor redColor] text:@"高品质专车，随叫随到!"];
    [backView addSubview:lab];
    
    
    //
    UIImageView *messageV = [self picForRect:CGRectMake(CGRectGetMaxX(backView.frame) + 10, backView.frame.origin.y + 1, 19, 16) image:@"message"];
    [_pic addSubview:messageV];
    
}

- (UILabel *)labelForRect:(CGRect)rect textColor:(UIColor *)color text:(NSString *)text
{
    UILabel *lab = [[UILabel alloc]init];
    lab.font = [UIFont systemFontOfSize:9];
    lab.textColor =color;
    lab.frame = rect;
    lab.text = text;
    
    return lab;
    
}


- (UIImageView *)picForRect:(CGRect)frame image:(NSString *)image
{
    
    UIImageView *back = [[UIImageView alloc]init];
    back.frame = frame;
    back.image = [UIImage imageNamed:image];
    
    return back;
}

- (UIButton *)btnForRect:(CGRect)rect image:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    return btn;
}


//
- (void)addPic
{
    _pic = [[UIImageView alloc]init];
    _pic.image = [UIImage imageNamed:@"back_pic"];
    _pic.userInteractionEnabled = YES;
    _pic.frame = self.view.bounds;
    [self.view addSubview:_pic];
}

//
- (void)addPhotoBtn:(CGRect)frame image:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.frame = frame;
    [_pic addSubview:btn];
    [btn addTarget:self action:@selector(photoAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)photoAction
{
//    NSLog(@"111");
    PhotoViewController *vc = [[PhotoViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nav animated:NO completion:nil];
    
}


//
- (void)addScrollView
{
    UIScrollView *scrollview = [[UIScrollView alloc]init];
    scrollview.frame = self.view.bounds;
    scrollview.backgroundColor = [UIColor clearColor];
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width * 3, 0);
    [_pic addSubview:scrollview];
    scrollview.pagingEnabled = YES;
    
    scrollview.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    scrollview.delegate = self;
    scrollview.showsVerticalScrollIndicator = NO;
    //
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(40 + self.view.frame.size.width, self.view.frame.size.height - 110, self.view.frame.size.width - 80, 80);
    view.backgroundColor = [UIColor whiteColor];
    [scrollview addSubview:view];
    
    
    //
    UIImageView *taxiV = [self picForRect:CGRectMake(45/2, 45/2, 35, 35) image:@"taxi"];
    [view addSubview:taxiV];
    
    //
    UILabel *lab = [self labelForRect:CGRectMake(CGRectGetMaxX(taxiV.frame)+ 10, taxiV.frame.origin.y + 5, 100, 12) textColor:[UIColor lightGrayColor] text:@"要去哪里?"];
    lab.textAlignment = 1;
    lab.font = [UIFont systemFontOfSize:12];
    [view addSubview:lab];
    
    //
    UIButton *btn = [self btnForRect:CGRectMake(CGRectGetMaxX(lab.frame) , taxiV.frame.origin.y + 4, 14, 14) image:@"touch"];
    [view addSubview:btn];
    
    //
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor lightGrayColor];
    line.frame = CGRectMake(lab.frame.origin.x + 15, CGRectGetMaxY(lab.frame) + 10, 100, 1);
    [view addSubview:line];
    
    
    //
    UIPageControl *page = [[UIPageControl alloc]init];
    page.frame = CGRectMake((_pic.frame.size.width - 100)/2, _pic.frame.size.height - 55, 100, 20);
//    page.backgroundColor = [UIColor redColor];
    page.numberOfPages = 3;
    page.currentPage = 1;
    [_pic addSubview:page];
    page.pageIndicatorTintColor = [UIColor lightGrayColor];
    page.currentPageIndicatorTintColor = [UIColor grayColor];
    self.page = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int count = scrollView.contentOffset.x / self.view.frame.size.width;
    
    self.page.currentPage = count;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
