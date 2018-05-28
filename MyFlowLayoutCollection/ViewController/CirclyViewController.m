//
//  CirclyViewController.m
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/26.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import "CirclyViewController.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others
#import "CircleLayour.h"

@interface CirclyViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *mCollectionView;

@end


#define ItemCount       25

static NSString * const CircleLayourCellID = @"CircleLayourCell";

@implementation CirclyViewController

#pragma mark - LazyLoad
- (UICollectionView *)mCollectionView {
    if (!_mCollectionView) {
        CircleLayour *layout = [[CircleLayour alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemCount = ItemCount;
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _mCollectionView.delegate = self;
        _mCollectionView.dataSource = self;
        [self.view addSubview:_mCollectionView];
        
        _mCollectionView.frame =CGRectMake(0, 64, 367, 500);
        
        
        [_mCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CircleLayourCellID];
        
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
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CircleLayourCellID forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 25;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return cell;
}

@end
