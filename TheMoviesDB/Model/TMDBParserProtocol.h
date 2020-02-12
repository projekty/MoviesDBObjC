//
//  TMDBFactory.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TMDBSourceType) {
    TMDBConfiguration,
    TMDBTypeNowPlaying,
    TMDBTypeSearch,
};


@protocol TMDBParserProtocol

@required
- (instancetype)initWithJSON:(NSDictionary *)json;

@end
