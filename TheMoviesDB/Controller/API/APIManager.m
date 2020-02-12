//
//  APIManager.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "APIManager.h"
#import "TMDBJSONParser.h"
#import "APIHelper.h"


@interface APIManager ()


@end

#pragma mark -
@implementation APIManager

#pragma mark - Singleton

+ (instancetype)shared {
    static APIManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
        manager.configuration = [[APIConfiguration alloc] init];
    });
    return manager;
}

#pragma mark - Public

- (void)getConfigurationWithCompletion:(nonnull void (^)(BOOL))completion {
    __weak APIManager *weakSelf = self;
    
    [self getURL: self.configuration.configurationUrl
      sourceType:TMDBConfiguration
      completion:^(TMDBBaseResponse * _Nonnull configResponse) {
        weakSelf.configuration.serverConfiguration = (TMDBConfigurationResponse *)configResponse;
        completion(YES);
    } errorBlock:^(APIEntryError * _Nonnull error) {
        completion(NO);
    }];
}

- (void)getNowPlayingForPage:(NSNumber *)page
                  completion:(nonnull void (^)(TMDBNowPlayingResponse * _Nonnull))completion
                  errorBlock:(APIErrorBlock)errorBlock {
    
    [self getNowPlayingWithLanguage:nil
                               page:page
                             region:nil
                         completion:completion
                         errorBlock:errorBlock];
}

- (void)getMoviesWithQuery:(NSString *)query
                   forPage:(NSNumber *)page
                completion:(nonnull void (^)(TMDBSearchResponse * _Nonnull))completion
                errorBlock:(APIErrorBlock)errorBlock {
    
    [self getMoviesWithQuery:query
                  withAPIKey:@"Asf"
                    language:@"pl-PL"//TODO: to const
                        page:page
                includeAdult:false
                      region:nil
                        year:nil
          primaryReleaseYear:nil
                  completion:completion
                  errorBlock:errorBlock];
}

#pragma mark - Private

- (void)getNowPlayingWithLanguage:(NSString * _Nullable)language
                             page:(NSNumber * _Nonnull)page
                           region:(NSString * _Nullable)region
                       completion:(nonnull void(^)(TMDBNowPlayingResponse * _Nonnull))completion
                       errorBlock:(APIErrorBlock)errorBlock {
    
    [self getURL:[self.configuration urlNowPlayingForPage:page language:language]
      sourceType:TMDBTypeNowPlaying
      completion:^(TMDBBaseResponse * _Nonnull response) {
        completion((TMDBNowPlayingResponse *)response);
    } errorBlock:errorBlock];
}

- (void)getMoviesWithQuery:(NSString * _Nonnull)query
                      withAPIKey:(NSString * _Nonnull)apiKey
                  language:(NSString * _Nullable)language
                      page:(NSNumber * _Nullable)page
              includeAdult:(BOOL)includeAdult
                    region:(NSString * _Nullable)region
                      year:(NSNumber * _Nullable)year
        primaryReleaseYear:(NSNumber * _Nullable)primaryReleaseYear
                completion:(nonnull void(^)(TMDBSearchResponse * _Nonnull))completion
                errorBlock:(APIErrorBlock)errorBlock {
    
    if (query.length == 0) {
        errorBlock([APIEntryError errorWithName:@"Query is empty"]);
    }
    
    [self getURL:[NSURL URLWithString:@""]//[NSString stringWithFormat:@"https://api.themoviedb.org/3/search/movie?api_key=%@&language=%@&query=%@&page=%@&include_adult=%@", apiKey, language, query, page, includeAdult ? @"true" : @"false"]
         sourceType:TMDBTypeSearch
         completion:^(TMDBBaseResponse * _Nonnull response) {
           completion((TMDBSearchResponse *)response);
       } errorBlock:errorBlock];
}

- (void)getURL:(NSURL *)url
    sourceType:(TMDBSourceType)type
    completion:(nonnull void(^)(TMDBBaseResponse * _Nonnull))completion
    errorBlock:(APIErrorBlock)errorBlock {
    
    dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t requestQueue = dispatch_queue_create("request", qos);

    dispatch_async(requestQueue, ^{
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"GET";
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                //TODO: send error
//                            errorBlock();
                return;
            }
            if (data) {
                NSError *parserError = nil;
                TMDBBaseResponse *response = [TMDBJSONParser responseFromJSONData:data error:&parserError sourceType:type];
                completion(response);
            }
        }] resume];
    });
}

@end
