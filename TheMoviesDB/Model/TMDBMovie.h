//
//  TMDBMovie.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBaseModel.h"
#import "CollectionSourceable.h"
#import "DetailSourceable.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBMovie<CollectionSourceable, DetailSourceable> : TMDBaseModel

@end

NS_ASSUME_NONNULL_END
