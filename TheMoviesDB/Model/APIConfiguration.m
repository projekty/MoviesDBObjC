//
//  APIConfiguration.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "APIConfiguration.h"

#pragma mark - Constants
NSString* const API_KEY = @"2bb6f8772a2010357641a07b3a40d89d";
NSString* const NOW_PLAYING = @"/movie/now_playing";

@implementation APIConfiguration

- (nullable NSURL *)configurationUrl {
    //TODO: make it proffesional
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:@"https://api.themoviedb.org/3/configuration"];//to const
    components.query = [self apiKeyQuery];
    NSURL * url = components.URL;
    return url;
}

- (nullable NSURL *)urlNowPlayingForPage:(NSNumber *)page language:(NSString * _Nullable)language {
    //TODO: make it proffesional (NSQueryItems)
    //TODO: add language
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:[NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/now_playing?%@&page=%@", [self apiKeyQuery], page]];//to const
//    components.query = [self apiKeyQuery];
    
    NSURL * url = components.URL;
    return url;
}

- (NSString *)apiKeyQuery {
    return [NSString stringWithFormat:@"api_key=%@", API_KEY];
}

@end
