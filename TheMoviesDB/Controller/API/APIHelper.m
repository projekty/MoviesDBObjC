//
//  APIKey.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "APIHelper.h"


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
        case APIKeyCount:                       return @"key_count";
    }
}

union matcher { APIKey key; BOOL match; };

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

@end


