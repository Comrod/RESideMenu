//
//  SecondViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 6/14/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "SecondViewController.h"
#import "DemoViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.902 green:0.859 blue:0.487 alpha:1.000];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:self action:@selector(showMenu)];
}

#pragma mark -
#pragma mark Button actions

- (void)showMenu
{
    RESideMenuItem *homeItem = [[RESideMenuItem alloc] initWithTitle:@"Go Back" action:^(RESideMenu *menu, RESideMenuItem *item) {
        [menu hide];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[DemoViewController alloc] init]];
        [menu setRootViewController:navigationController];
    }];
    
    _sideMenu = [[RESideMenu alloc] initWithItems:@[homeItem]];
    _sideMenu.verticalOffset = IS_WIDESCREEN ? 250 : 230;
    _sideMenu.hideStatusBarArea = [AppDelegate OSVersion] < 7;
    [_sideMenu show];
}


@end
