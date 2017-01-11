//
//  ViewController.m
//  LFY_UITablViewBublleView
//
//  Created by apple on 17/1/11.
//  Copyright © 2017年 com.cooper.dtag. All rights reserved.
//

#import "ViewController.h"
#import "BBBButton.h"
#import "ShareTipsView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
-(void)setUI{
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

- (void)dismissShareTipsView:(NSTimer *) timer{
    ShareTipsView *tipsView = (ShareTipsView *)[timer userInfo];
    [tipsView cancleView];
}



#pragma mark - Action


- (void)shareBtnPressed:(BBBButton *)sender{
   
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:sender.indexPath];
    BBBButton *btn = [cell.contentView viewWithTag:104];
    btn.selected = !btn.selected;
    CGRect rect = [cell.contentView convertRect:btn.frame toView:self.view];
    
    CGFloat x = rect.origin.x+rect.size.width-202./2 +5;
    ShareTipsView *tipsView = [[ShareTipsView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [tipsView configViweWithFrame:CGRectMake(x, rect.origin.y-62./2, 202./2, 62./2) shareBubbleType:ShareBubbleTypeQQ];
    UIView *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:tipsView];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(dismissShareTipsView:) userInfo:tipsView repeats:NO];
    [_tableView reloadData];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"分享到QQ空间";
        BBBButton *qqShareBtn = [BBBButton buttonWithType:UIButtonTypeCustom];
        qqShareBtn.tag = 104;
        qqShareBtn.indexPath = indexPath;
        [qqShareBtn setImage:[UIImage imageNamed:@"发布-空间-未点击"] forState:UIControlStateNormal];
        [qqShareBtn setImage:[UIImage imageNamed:@"发布-空间"] forState:UIControlStateSelected];
        [qqShareBtn addTarget:self action:@selector(shareBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:qqShareBtn];
        qqShareBtn.frame = CGRectMake(160, (50-56./2)/2, 56./2, 56./2);
    }
    return cell;

}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}





@end
