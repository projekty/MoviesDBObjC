//
//  TMDBCollectionDataSource.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBCollectionDataSource.h"

@implementation TMDBCollectionDataSource

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pagedMovies = [[NSMutableArray alloc] initWithCapacity:1000];
        _totalResults = @0;
        _totalPages = @0;
    }
    return self;
}


#pragma  mark -  UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.totalPages.integerValue;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *movies = [self moviesForSection:section];
    return movies ? movies.count : 0;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [[NSException exceptionWithName:@"" reason:@"Is not implemented" userInfo:nil] raise];
    return [UICollectionViewCell new];
}

#pragma mark - Movies array

- (NSInteger)sectionForPage:(NSNumber *)page {
    return page.integerValue - 1;
}

- (nullable NSArray<TMDBMovie *> *)moviesForSection:(NSInteger)section {
    if (section < self.pagedMovies.count) {
        return self.pagedMovies[section];
    }
    return nil;
}

@end
