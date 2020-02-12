//
//  APIManager.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBNowPlayingResponse.h"
#import "TMDBSearchResponse.h"
#import "APIEntryError.h"
#import "APIConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

@property (nonatomic, strong) APIConfiguration *configuration;

+ (instancetype)shared;

- (void)getConfigurationWithCompletion:(nonnull void (^)(BOOL))completion;

- (void)getNowPlayingForPage:(NSNumber *)page
                  completion:(nonnull void (^)(TMDBNowPlayingResponse * _Nonnull))completion
                  errorBlock:(APIErrorBlock)errorBlock;

- (void)getMoviesWithQuery:(NSString *)query
                   forPage:(NSNumber *)page
                completion:(nonnull void (^)(TMDBSearchResponse * _Nonnull))completion
                errorBlock:(APIErrorBlock)errorBlock;

@end

NS_ASSUME_NONNULL_END

