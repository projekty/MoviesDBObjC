//
//  APIKey.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIKeys.h"

NS_ASSUME_NONNULL_BEGIN

@interface APIHelper : NSObject

+ (NSString *)valueForKey:(APIKey)key;
+ (APIKey)keyWithValue:(NSString *)value;
+ (NSURL *)urlForImagePath:(NSString *)imagePath;

@end

NS_ASSUME_NONNULL_END
