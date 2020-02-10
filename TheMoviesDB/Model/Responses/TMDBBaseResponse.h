//
//  TMDBBaseResponse.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBMovie.h"
#import "TMDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBBaseResponse : TMDBaseModel

@property (nonatomic, strong) NSNumber *page;//min = 1, max = 1000, default = 1
@property (nonatomic, strong) NSArray<TMDBMovie *> *results;
@property (nonatomic, strong) NSNumber *totalPages;
@property (nonatomic, strong) NSNumber *totalResults;

- (instancetype)initWithJSON:(NSDictionary *)json sourceType:(TMDBSourceType)type;

@end

NS_ASSUME_NONNULL_END

typedef void (^TMDBResponseBlock)(TMDBBaseResponse *_Nonnull);
