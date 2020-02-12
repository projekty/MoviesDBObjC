//
//  TMDBNowPlayingCollectionViewDataSource.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDBCollectionDataSource.h"
#import "TMDBNowPlayingResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBNowPlayingCollectionViewDataSource : TMDBCollectionDataSource

- (void)appendResponse:(TMDBNowPlayingResponse *)response;

@end

NS_ASSUME_NONNULL_END
