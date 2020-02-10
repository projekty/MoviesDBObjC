//
//  TMDBBaseModel.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBaseModel.h"

@implementation TMDBaseModel

- (instancetype)initWithJSON:(nonnull NSDictionary *)json {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:json];
    }
    return self;
}

@end
