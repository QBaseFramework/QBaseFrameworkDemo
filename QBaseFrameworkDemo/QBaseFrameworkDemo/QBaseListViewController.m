//
//  QBaseListViewController.m
//  QBaseFrameworkDemo
//
//  Created by andy on 11/3/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseListViewController.h"
#import "QBaseDemoViewController.h"
#import "QBaseRefreshViewController.h"

@interface QBaseListViewController ()

@end

@implementation QBaseListViewController

#pragma mark -
#pragma mark 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITableView *t = [[UITableView alloc] initWithFrame:self.view.bounds];
    t.delegate = self;
    t.dataSource = self;
    [self.view addSubview:t];

    _dataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"VC" ofType:@"plist"]];
    [t reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellID = @"CellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellID];
    }
    
    NSDictionary *vcInfo = [_dataArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [vcInfo objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *vcInfo = [_dataArray objectAtIndex:indexPath.row];

    NSString *vcName = [vcInfo objectForKey:@"vc_name"];

    Class vcClass = NSClassFromString(vcName);
    
    QBaseViewController *vc = [[vcClass alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
