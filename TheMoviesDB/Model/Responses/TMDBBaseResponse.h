//
//  TMDBBaseResponse.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBBaseResponse : NSObject

@property (nonatomic, strong) NSNumber *page;//min = 1, max = 1000, default = 1
@property (nonatomic, strong) NSArray<TMDBMovie *> *results;
@property (nonatomic, strong) NSNumber *totalPages;
@property (nonatomic, strong) NSNumber *totalResults;

- (instancetype)initWithJSON:(NSJSONSerialization *)json;

@end

NS_ASSUME_NONNULL_END
