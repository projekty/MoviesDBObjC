//
//  TMDBBaseModel.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDBParserProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBaseModel : NSObject <TMDBParserProtocol>

- (instancetype)initWithJSON:(nonnull NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
