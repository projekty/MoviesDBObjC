//
//  TMDBCollectionDataSource.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDBMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBCollectionDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray<NSArray<TMDBMovie *>*> *pagedMovies;//index is a section(page)
@property (nonatomic, assign) NSNumber *totalResults;
@property (nonatomic, assign) NSNumber *totalPages;

- (NSInteger)sectionForPage:(NSNumber *)page;
- (nullable NSArray<TMDBMovie *> *)moviesForSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
