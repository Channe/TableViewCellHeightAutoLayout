//
//  ViewController.m
//  AutolayoutUITableViewCell_iOS7
//
//  Created by QianLei-Mac on 5/23/15.
//  Copyright (c) 2015 channe-Mac. All rights reserved.
//

#import "ViewController.h"
#import "iOS7TableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *labelArray;
@property (strong, nonatomic) iOS7TableViewCell *prototypeCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"iOS7TableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"iOS7TableViewCell"];
    // 初始化 prototypeCell 以便复用
    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"iOS7TableViewCell"];
    
    // 循环生成 label 文字内容
    self.labelArray = [NSMutableArray array];
    for (int i = 1; i <= 20; i++) {
        NSMutableString *text = [NSMutableString stringWithString:@""];
        for (int j = 1; j <= i; j++) {
            [text appendString:@"Auto Layout "];
        }
        [self.labelArray addObject:text];
    }
}

//必须实现此方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    iOS7TableViewCell *cell = self.prototypeCell;
    cell.detailLabel.text = self.labelArray[indexPath.row];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"size.height:%f",size.height);
    return size.height + 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    iOS7TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iOS7TableViewCell" forIndexPath:indexPath];
    
    cell.detailLabel.text = self.labelArray[indexPath.row];
    
    return cell;
}

@end
