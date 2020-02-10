//
//  TMDBDate.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBDate : TMDBaseModel

@property (nonatomic, strong) NSString *maximum;
@property (nonatomic, strong) NSString *minimum;

@end

NS_ASSUME_NONNULL_END
