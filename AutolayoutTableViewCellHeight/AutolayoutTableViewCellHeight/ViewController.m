//
//  ViewController.m
//  AutolayoutTableViewCellHeight
//
//  Created by QianLei-Mac on 5/23/15.
//  Copyright (c) 2015 channe-Mac. All rights reserved.
//

#import "ViewController.h"
#import "firstTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *labelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UINib *nib = [UINib nibWithNibName:@"firstTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"firstTableViewCell"];

    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    firstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstTableViewCell" forIndexPath:indexPath];
    
    cell.detailLabel.text = self.labelArray[indexPath.row];
    
    return cell;
}

@end
