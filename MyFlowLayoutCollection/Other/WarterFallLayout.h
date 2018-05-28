//
//  WarterFallLayout.h
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/26.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WarterFallLayout;

@protocol WarterFallLayoutDelegate <NSObject>
@optional

/// 列数
- (CGFloat)columnCountInFallsLayout:(WarterFallLayout *)fallsLayout;
/// 列间距
- (CGFloat)columnMarginInFallsLayout:(WarterFallLayout *)fallsLayout;
/// 行间距
- (CGFloat)rowMarginInFallsLayout:(WarterFallLayout *)fallsLayout;
/// collectionView边距
- (UIEdgeInsets)edgeInsetsInFallsLayout:(WarterFallLayout *)fallsLayout;
@end

@interface WarterFallLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<WarterFallLayoutDelegate> delegate;

@end
