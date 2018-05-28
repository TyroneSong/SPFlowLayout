//
//  WheelViewController.m
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/26.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import "WheelViewController.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others
#import "WheelLayout.h"

@interface WheelViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation WheelViewController

#pragma mark - LazyLoad


#pragma mark - LifeCyle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    
    [self setUpData];
}

#pragma mark - Base
/** Make UI */
- (void)setUpUI {
    
    WheelLayout * layout = [[WheelLayout alloc]init];
    UICollectionView * collect  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 400) collectionViewLayout:layout];
    collect.delegate=self;
    collect.dataSource=self;
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collect];
    
    collect.backgroundColor = [UIColor whiteColor];
    //一开始将collectionView的偏移量设置为1屏的偏移量
    collect.contentOffset = CGPointMake(0, 400);
}

/** Make Data */
- (void)setUpData {
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 80)];
    label.text = [NSString stringWithFormat:@"我是第%ld行",(long)indexPath.row];
    [cell.contentView addSubview:label];
    return cell;
}

#pragma mark - ===============  ScrollerDelegate  ===============
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //小于半屏 则放到最后一屏多半屏
    if (scrollView.contentOffset.y<200) {
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y+10*400);
        //大于最后一屏多一屏 放回第一屏
    }else if(scrollView.contentOffset.y>11*400){
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y-10*400);
    }
}

@end
