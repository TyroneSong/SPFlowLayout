//
//  WaterFallViewController.m
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/26.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import "WaterFallViewController.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others
#import "WarterFallLayout.h"

@interface WaterFallViewController ()<UICollectionViewDataSource, WarterFallLayoutDelegate>

@property (nonatomic, strong) UICollectionView *mCollectionView;

@end

@implementation WaterFallViewController

#pragma mark - LazyLoad
- (UICollectionView *)mCollectionView{
    if (!_mCollectionView) {
        WarterFallLayout *layout = [[WarterFallLayout alloc] init];
        layout.delegate = self;
        
        
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_mCollectionView];
        
        _mCollectionView.dataSource = self;
        _mCollectionView.frame = CGRectMake(0, 64, 357, 600);
        
        [_mCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    }
    return _mCollectionView;
}

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
    self.mCollectionView.backgroundColor = [UIColor whiteColor];
}

/** Make Data */
- (void)setUpData {
    
}

#pragma mark - Setting

#pragma mark - Getting


#pragma mark - -----------<Delegate>----------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 90;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

- (CGFloat)columnMarginInFallsLayout:(WarterFallLayout *)fallsLayout
{
    return 5;
}

- (CGFloat)rowMarginInFallsLayout:(WarterFallLayout *)fallsLayout
{
    return 5;
}

- (CGFloat)columnCountInFallsLayout:(WarterFallLayout *)fallsLayout
{
    return 6;
}

- (UIEdgeInsets)edgeInsetsInFallsLayout:(WarterFallLayout *)fallsLayout
{
    return UIEdgeInsetsMake(20, 10, 20, 10);
}

@end
