//
//  TMDBJSONParser.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBBaseResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBJSONParser : NSObject

+ (TMDBBaseResponse *)responseFromJSONData:(NSData *)jsonData error:(__autoreleasing NSError **)error sourceType:(TMDBSourceType)type;

@end

NS_ASSUME_NONNULL_END
