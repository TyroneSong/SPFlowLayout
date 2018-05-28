//
//  ViewController.m
//  MyFlowLayoutCollection
//
//  Created by 石头 on 2018/5/25.
//  Copyright © 2018 宋璞. All rights reserved.
//

#import "ViewController.h"

#import "FirstViewController.h"
#import "CirclyViewController.h"
#import "WheelViewController.h"
#import "BallViewController.h"
#import "WaterFallViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *mTableView;

@property (nonatomic, strong) NSMutableArray *titleArray;

@end

static NSString * const CellId = @"Cell";

@implementation ViewController

- (UITableView *)mTableView{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        [self.view addSubview:_mTableView];
        
        
    }
    return _mTableView;
}

- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc] init];
    }
    return _titleArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpUI];
    
    [self setUpData];
    
    [self.mTableView reloadData];
}

- (void)setUpUI {
    self.mTableView.tableFooterView = [UIView new];
}

- (void)setUpData {
    [self.titleArray addObject:@"第一个"];
    [self.titleArray addObject:@"圆圈"];
    [self.titleArray addObject:@"滚轮"];
    [self.titleArray addObject:@"球"];
    [self.titleArray addObject:@"瀑布流"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ===============  UITableViewDataSource  ===============
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *VC = nil;
    
    if (indexPath.row == 0) VC = [[FirstViewController alloc] init];
    if (indexPath.row == 1) VC = [[CirclyViewController alloc] init];
    if (indexPath.row == 2) VC = [[WheelViewController alloc] init];
    if (indexPath.row == 3) VC = [[BallViewController alloc] init];
    if (indexPath.row == 4) VC = [[WaterFallViewController alloc] init];
    
    
    VC.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:VC animated:YES];
    
    
}

@end

