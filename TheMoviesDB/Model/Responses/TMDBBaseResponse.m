//
//  TMDBBaseResponse.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBBaseResponse.h"
#import "TMDBNowPlayingResponse.h"
#import "TMDBSearchResponse.h"
#import "APIHelper.h"

@implementation TMDBBaseResponse


- (instancetype)initWithJSON:(id)json sourceType:(TMDBSourceType)type {
    self = nil;
    switch (type) {
        case TMDBTypeNowPlaying:
            self = [[TMDBNowPlayingResponse alloc] initWithJSON:json];
            break;
            
        case TMDBTypeSearch:
            self = [[TMDBSearchResponse alloc] initWithJSON:json];
             break;
    }
    
    return self;
}
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
   
    APIKey apiKey = [APIHelper keyWithValue:key];
    
    switch (apiKey) {
        case APIKeyTotalPages:        [self setValue:value forKey:@"totalPages"];          break;
        case APIKeyTotalResults:      [self setValue:value forKey:@"totalResults"];        break;
        default:                        [super setValue:value forUndefinedKey:key];        break;
    }
}
/*- (instancetype)initWithJSON:(NSDictionary *)json {
    [NSException raise:NSInternalInconsistencyException
                format:@"%@: Method %@ is not implement.", NSStringFromClass([self class]), NSStringFromSelector(_cmd)];
    return nil;
}*/



@end
