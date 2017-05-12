//
//  ViewController.m
//  LHYGFWeiChatTableViewCell
//
//  Created by Huoyi Lin on 2017/5/11.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "ViewController.h"
#import "LHYGFWeiChatCell.h"
#import "TYYDemoVC.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController
- (IBAction)ads:(UIButton *)sender {
    [self.navigationController pushViewController:[TYYDemoVC new] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];
//    
//    [self.tableView registerClass:[LHYGFWeiChatCell class] forCellReuseIdentifier:@"LHYGFWeiChatCell"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LHYGFWeiChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LHYGFWeiChatCell"];
    if (cell == nil) {
        cell = [[LHYGFWeiChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LHYGFWeiChatCell" indexPath:indexPath];
    }
    
    return cell;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"didi bsad");
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"DFDF" object:nil];
//}

//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//      [self.tableView reloadData];
//        
//    }];
//    return @[deleteRowAction];
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
