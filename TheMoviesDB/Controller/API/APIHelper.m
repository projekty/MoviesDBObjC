//
//  APIKey.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "APIHelper.h"
#import "APIManager.h"

@implementation APIHelper

typedef struct {
    APIKey key;
    NSString *value;
    BOOL match;
}APIKeyMatcher;


+ (NSString *)valueForKey:(APIKey)key {
    switch (key) {
       
        case APIKeyStatusMessage:               return @"status_message";
        case APIKeyErrors:                      return @"errors";
        case APIKeyDates:                       return @"dates";
        case APIKeyResult:                      return @"results";
        case APIKeyVoteCount:                   return @"vote_count";
        case APIKeyVoteAverage:                 return @"vote_average";
        case APIKeyReleaseDate:                 return @"release_date";
        case APIKeyOriginalLanguage:            return @"original_language";
        case APIKeyOriginalTitle:               return @"original_title";
        case APIKeyGenreIds:                    return @"genre_ids";
        case APIKeyBackdropPath:                return @"backdrop_path";
        case APIKeyPosterPath:                  return @"poster_path";
        case APIKeyTotalPages:                  return @"total_pages";
        case APIKeyTotalResults:                return @"total_results";
        case APIKeyNone:                        return @"key_none";
        case APIKeyBackdropSizes:               return @"backdrop_sizes";
        case APIKeyPosterSizes:                 return @"poster_sizes";
        case APIKeyImages:                      return @"images";
        case APISecureBaseURL:                  return @"secure_base_url";
        case APIKeyCount:                       return @"key_count";
    }
}

+ (APIKey)keyWithValue:(NSString *)value {
    for (int i = 0; i < APIKeyCount; i++) {
        APIKeyMatcher matcher = [self key:(APIKey)i matchToValue:value];
        if (matcher.match) {
            return matcher.key;
        }
    }
    
    return APIKeyNone;
}

+ (APIKeyMatcher)key:(APIKey)key matchToValue:(NSString *)value {
    APIKeyMatcher matcher = { key, value, NO };
    
    if ([value isEqualToString:[self valueForKey:key]]) {
        matcher.match = YES;
    }
    return matcher;
}

#pragma mark - Images
+ (NSURL *)urlForImagePath:(NSString *)imagePath {
    //TODO: get configuration, get size and handle
    
    NSString *base = [APIManager shared].configuration.serverConfiguration.secureBaseURL;
    NSArray *sizes = [APIManager shared].configuration.serverConfiguration.backdropSizes;
    __unused NSString *size = sizes.firstObject;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@w342%@", base, imagePath]];
    return url;
}

@end


