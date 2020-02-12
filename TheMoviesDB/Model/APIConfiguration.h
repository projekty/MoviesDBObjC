//
//  APIConfiguration.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBConfigurationResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIConfiguration : NSObject

@property (nonatomic, strong) TMDBConfigurationResponse *serverConfiguration;
- (nullable NSURL *)configurationUrl;
- (nullable NSURL *)urlNowPlayingForPage:(NSNumber *)page language:(NSString * _Nullable)language;

@end

NS_ASSUME_NONNULL_END
