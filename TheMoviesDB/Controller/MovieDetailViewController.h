//
//  MovieDetailViewController.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionSourceable.h"
#import "DetailSourceable.h"

@interface MovieDetailViewController : UIViewController

@property (nonatomic, weak) id<CollectionSourceable, DetailSourceable> source;

@end
