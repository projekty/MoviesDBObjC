//
//  TMDBConfigurationResponse.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBBaseResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBConfigurationResponse : TMDBBaseResponse

@property (nonatomic, strong) NSString *secureBaseURL;
@property (nonatomic, strong) NSArray<NSString *> *backdropSizes;
@property (nonatomic, strong) NSArray<NSString *> *posterSizes;

@end

NS_ASSUME_NONNULL_END
