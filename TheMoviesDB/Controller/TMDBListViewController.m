//
//  ViewController.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBListViewController.h"
#import "APIManager.h"

@interface TMDBListViewController ()

@end

@implementation TMDBListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)loadData {
    [[APIManager shared] request];
}

@end
