//
//  CircleLayour.m
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/25.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import "CircleLayour.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others

@interface CircleLayour ()
{
    NSMutableArray * _attributeAttay;
}
@end

@implementation CircleLayour

- (void)prepareLayout {
    
    [super prepareLayout];
    
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    
    _attributeAttay = [[NSMutableArray alloc] init];
    
    /** 大圆半径  collectionView 的width/hight 最小值 */
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height) * 0.5;
    /** 圆心的位置 */
    CGPoint center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    
    /** 每个item的大小50，，，半径25 */
    for (int i = 0; i < _itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attris.size = CGSizeMake(50, 50);
        
        /** 圆心 */
        float x = center.x + cosf(2*M_PI/_itemCount*i) * (radius - 25);
        float y = center.y + sinf(2*M_PI/_itemCount*i) * (radius - 25);
        
        attris.center = CGPointMake(x, y);
        
        [_attributeAttay addObject:attris];
    }
    
}

/** 设置内容区域的大小 */
- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

/** 返回数组 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeAttay;
}
@end
