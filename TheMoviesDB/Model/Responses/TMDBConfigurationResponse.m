//
//  TMDBConfigurationResponse.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBConfigurationResponse.h"
#import "APIHelper.h"

@implementation TMDBConfigurationResponse

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    APIKey apiKey = [APIHelper keyWithValue:key];

    switch (apiKey) {
        case APIKeyImages:
            if ([value isKindOfClass:[NSDictionary class]]) {
                [self setValue:((NSDictionary *)value)[[APIHelper valueForKey:APIKeyBackdropSizes]] forKey:@"posterSizes"];
                [self setValue:((NSDictionary *)value)[[APIHelper valueForKey:APIKeyPosterSizes]] forKey:@"backdropSizes"];
                [self setValue:((NSDictionary *)value)[[APIHelper valueForKey:APISecureBaseURL]] forKey:@"secureBaseURL"];
            }
            break;
        default:
            break;
    }
}

@end
