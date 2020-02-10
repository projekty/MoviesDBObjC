//
//  TMDBJSONParser.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBJSONParser.h"
#import "APIHelper.h"

@implementation TMDBJSONParser

+ (TMDBBaseResponse *)responseFromJSONData:(NSData *)jsonData error:(__autoreleasing NSError **)error sourceType:(TMDBSourceType)type {
    *error = nil;
    id json = [self jsonFromJSONData:jsonData jsonError:error];
    if (*error) {
        return nil;
    }
    TMDBBaseResponse *model = [self modelFromResponseJSON:json error:error sourceType:type];
    if (*error) {
        return nil;
    }
    return model;
    
}

+ (TMDBBaseResponse *)modelFromResponseJSON:(NSDictionary *)json error:(__autoreleasing NSError **)error sourceType:(TMDBSourceType)type {
    
    id message = json[[APIHelper valueForKey:APIKeyStatusMessage]];
    id errors = json[[APIHelper valueForKey:APIKeyErrors]];
    if (message || errors) {
        *error = [NSError errorWithDomain:@"Bad query" code:1 userInfo:@{NSLocalizedDescriptionKey: errors ? errors : message}];
        return nil;
    }
    return [[TMDBBaseResponse alloc] initWithJSON:json sourceType:type];
}

+ (id _Nullable)jsonFromJSONData:(nonnull NSData *)jsonData jsonError:(__autoreleasing NSError **)jsonError {
    
    NSError *error = nil;
    
    id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
   
    if (error) {
        *jsonError = [NSError errorWithDomain:@"Bad json data." code:0 userInfo:@{NSUnderlyingErrorKey: error}];
        return nil;
    }
    return json;
}

@end
