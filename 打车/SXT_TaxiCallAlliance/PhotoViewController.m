//
//  PhotoViewController.m
//  SXT_TaxiCallAlliance
//
//  Created by ts on 17/5/27.
//  Copyright © 2017年 PAN. All rights reserved.
//

#import "PhotoViewController.h"
#define kScreenWidth self.view.frame.size.width
#define kScreenHeight self.view.frame.size.height
#define RGBColor(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define Font(a) [UIFont systemFontOfSize:(a)]
#define Frame(a,b,c,d) CGRectMake(a, b , c ,d)
#import "UIView+UIView.h"


@interface PhotoViewController ()
{
    CGFloat _ViewY;
}


@property(nonatomic,weak)UIScrollView *scrollView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBColor(240, 240, 240);
    
    //
    [self addScroll];
    //设置导航栏
    [self setupNav];
    
    [self addFirst];
     
    [self addSecond];
    
    [self addThird];
    
    
    [self addFour];
    
    [self addFive];
    
    [self addSix];
}

- (void)addSix
{
    NSArray *arr = @[@"用户协议",@"给APP评分"];
    UIView *four = [self createViewWithViewY:(_ViewY + 10)  dataArr:arr];
    [self.scrollView addSubview:four];
    _ViewY += arr.count * 35 + 15 + 10;
}

- (void)addFive
{
    NSArray *arr = @[@"推荐得礼",@"时讯通联名卡",@"车险保险"];
    UIView *four = [self createViewWithViewY:(_ViewY + 10)  dataArr:arr];
    [self.scrollView addSubview:four];
    _ViewY += arr.count * 35 + 15 + 10;
}



- (void)addFour
{
    NSArray *arr = @[@"司机加盟",@"商企用车"];
    UIView *four = [self createViewWithViewY:(_ViewY + 10)  dataArr:arr];
    [self.scrollView addSubview:four];
    _ViewY += arr.count * 35 + 15 + 10;
}


- (UIView *)createViewWithViewY:(CGFloat)viewY dataArr:(NSArray *)dataArr
{
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:view];
    view.x = 10;
    view.y = viewY;
    view.width = kScreenWidth - 20;
    view.height = dataArr.count * 35 + 15;
    
    //
    for (NSInteger i = 0; i < dataArr.count; i++) {
        UILabel *lab = [[UILabel alloc]init];
        lab.font = Font(12);
        lab.textColor = RGBColor(110, 110, 110);
        [view addSubview:lab];
        lab.text = dataArr[i];
        lab.frame = Frame(10, 35 * i, 200, 35);
        
        //添加线
        UIView *line = [[UIView alloc]init];
        line.frame = Frame(0, 35 * (i + 1), view.frame.size.width, 1);
        line.backgroundColor = RGBColor(235, 235, 235);
        [view addSubview:line];
        //添加按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"rightBtn"] forState:UIControlStateNormal];
        btn.frame = Frame(view.frame.size.width - 20, lab.y, 6, 35);
        [view addSubview:btn];
        
    }
    
    
    
    
    
    
    return view;
}



//
- (void)addThird
{
    //
    CGFloat btnW = (kScreenWidth - 20 - 15 * 2 - 25 * 3)/4;
    UIView *third = [[UIView alloc]init];
    third.frame = Frame(10, _ViewY, kScreenWidth - 20, btnW + 30);
    third.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:third];
    _ViewY += btnW + 30;
    
    //添加按钮
    
    
    NSArray *arr = @[@"btn1",@"btn2",@"btn3",@"btn4"];
    for (NSInteger i = 0; i < arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        btn.frame = Frame(15 + (btnW + 25) * i,     15, btnW, btnW);
        [third addSubview:btn];
    }
    
    
    
}




//
- (void)addScroll
{
    UIScrollView *scroll = [[UIScrollView alloc]init];
    scroll.frame = Frame(0, 0, kScreenWidth, kScreenHeight);
    scroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scroll];
    scroll.contentSize = CGSizeMake(0, 550);
    self.scrollView = scroll;
    
    scroll.showsVerticalScrollIndicator = NO;
    
}
//
- (void)addSecond
{
    UIImageView *mem_pic = [[UIImageView alloc]init];
    mem_pic.image = [UIImage imageNamed:@"advertise"];
    
    mem_pic.frame = CGRectMake(10,0 + 70 + 10, kScreenWidth - 20   , (kScreenWidth - 20) * 37 / 237);
    [self.scrollView addSubview:mem_pic];
    _ViewY = 0 + 70 + 10 + (kScreenWidth - 20) * 37 / 237 + 10;
}


//
- (void)addFirst
{
    
    UIView *first = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    first.backgroundColor = RGBColor(76, 76, 76);
    [self.scrollView addSubview:first];
    
    CGFloat height = (first.frame.size.height - 20);
    
    
    //添加背景遮盖视图
    UIView *coverV = [[UIView alloc]initWithFrame:CGRectMake(55, 8,kScreenWidth - 55 - 10 , height + 4)];
    coverV.backgroundColor = [UIColor whiteColor];
    [first addSubview:coverV];
    
    //
    UIImageView *pic = [[UIImageView alloc]init];
    pic.image = [UIImage imageNamed:@"photo_personal"];
    
    pic.frame = CGRectMake(10, 10, height, height);
    [first addSubview:pic];
    //添加文本
    NSArray *arr = @[@"经验值",@"会员等级",@"72"];
    
    for (NSInteger i = 0; i < arr.count; i++) {
        UILabel *lab = [[UILabel alloc]init];
        lab.text = arr[i];
        if (i < 2) {
            lab.textColor = RGBColor(207, 207, 207);
            lab.font = Font(10);
            height = 10;
            
        }else{
            lab.textColor = RGBColor(80, 80, 80);
            lab.font = Font(14);
            height = 14;
        }
        NSInteger col = i % 2;
        NSInteger line = i / 2;
        CGFloat width = coverV.frame.size.width / 2;
        lab.textAlignment = 1;
        
        lab.frame = Frame(width * col, 10 + line * 20, width, height);
        [coverV addSubview:lab];
        
    }
    
    
    //添加
    UIImageView *mem_pic = [[UIImageView alloc]init];
    mem_pic.image = [UIImage imageNamed:@"member_personal"];
    
    mem_pic.frame = CGRectMake(coverV.frame.size.width * 3/ 4 - 31/2, 30 + 3/2, 31, 11);
    [coverV addSubview:mem_pic];
}





//
- (void)setupNav
{
    [self.navigationController.navigationBar setBarTintColor:RGBColor(66, 66, 66)];
    
    //设置标题
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 220, 23)];
    [titleView setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView = titleView;
    
    //添加两个文本
    NSString *str = @"张玲玲  时讯通ID：68112321";
    NSMutableAttributedString *attStr = [[NSMutableAttributedString  alloc]initWithString:str];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 3)];
    UILabel *lab = [[UILabel alloc]init];
    lab.textAlignment = 1;
    lab.frame = titleView.bounds;
    [titleView addSubview:lab];
    lab.font = [UIFont systemFontOfSize:10];
    lab.textColor = [UIColor whiteColor];
    lab.attributedText = attStr;
    
    
    
    //改变状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //左侧按钮
    UIButton *leftB = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftB setImage: [UIImage imageNamed:@"leftBarItem"] forState:UIControlStateNormal];
    
    leftB.frame = CGRectMake(0, 0, 15, 23);
        leftB.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    [leftB addTarget:self action:@selector(backto) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftB];
    
    //右侧按钮
    UIButton *rightB = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightB setImage: [UIImage imageNamed:@"rightBarItem"] forState:UIControlStateNormal];
    
    rightB.frame = CGRectMake(0, 0, 15, 23);
    rightB.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
//    [leftB addTarget:self action:@selector(backto) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightB];
}

- (void)backto
{
    [self dismissViewControllerAnimated:NO completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
