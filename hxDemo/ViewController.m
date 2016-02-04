//
//  ViewController.m
//  hxDemo
//
//  Created by heke on 16/2/4.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "ViewController.h"
#import "ChatViewController.h"
#import "ConversationListController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 74, 80, 40);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(doLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)doLogin:(id)sender {
//    ChatViewController *chatVC = [[ChatViewController alloc] initWithConversationChatter:@"hx_1" conversationType:eConversationTypeChat];
//    [self.navigationController pushViewController:chatVC animated:YES];
    
    ConversationListController *cvc = [[ConversationListController alloc] init];
    [self.navigationController pushViewController:cvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
