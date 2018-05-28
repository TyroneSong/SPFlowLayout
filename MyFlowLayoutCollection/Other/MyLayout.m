//
//  MyLayout.m
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/25.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import "MyLayout.h"

// Controllers

// Models

// Views

// Vendors

// Categories

// Others

@interface MyLayout ()
{
    NSMutableArray *_attributArray;
}

@end

@implementation MyLayout

- (void)prepareLayout {
    _attributArray = [[NSMutableArray alloc] init];
    [super prepareLayout];
    
    float WIDTH = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2;
    
    CGFloat colHight[2] = {self.sectionInset.top, self.sectionInset.bottom};
    
    for (int i = 0; i < _itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        UICollectionViewLayoutAttributes * attribs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        CGFloat height = arc4random() % 150 + 40;
        
        int width  = 0;
        if (colHight[0] < colHight[1]) {
            colHight[0] =  colHight[0] + height + self.minimumLineSpacing;
            width = 0;
        } else {
            colHight[1] = colHight[1] + height + self.minimumLineSpacing;
            width = 1;
        }
        
        attribs.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + WIDTH) * width, colHight[width] - self.minimumLineSpacing - height, WIDTH, height);
        
        [_attributArray addObject:attribs];
    }
    
    if (colHight[0]> colHight[1]) {
        self.itemSize = CGSizeMake(WIDTH, (colHight[0] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(WIDTH, (colHight[1] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributArray;
}



@end
