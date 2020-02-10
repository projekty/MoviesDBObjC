//
//  TMDBNowPlaying.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBNowPlayingResponse.h"
#import "TMDBDate.h"
#import "APIHelper.h"

@interface TMDBNowPlayingResponse ()

@property (nonatomic, strong) TMDBDate *dates;

@end


@implementation TMDBNowPlayingResponse

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    APIKey apiKey = [APIHelper keyWithValue:key];
    
    switch (apiKey) {
        case APIKeyDates:
            [self setValue:value forKey:@"dates"];
            break;
        default:
            [super setValue:value forUndefinedKey:key];
            break;
    }
}

@end
