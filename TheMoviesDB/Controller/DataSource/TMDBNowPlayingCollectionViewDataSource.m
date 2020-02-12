//
//  TMDBNowPlayingCollectionViewDataSource.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBNowPlayingCollectionViewDataSource.h"
#import "TMDBMovieCollectionViewCell.h"

@interface TMDBNowPlayingCollectionViewDataSource ()


@end

@implementation TMDBNowPlayingCollectionViewDataSource

- (void)appendResponse:(TMDBNowPlayingResponse *)response {
    [self.pagedMovies addObject:response.results];
//    self.pagedMovies = response.results;
    self.totalResults = response.totalResults;
    self.totalPages = response.totalPages;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TMDBMovieCollectionViewCell * cell = (TMDBMovieCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:[TMDBMovieCollectionViewCell identifier] forIndexPath:indexPath];
    
    NSArray *movies = [self moviesForSection:indexPath.section];
    if (movies) {
        id<CollectionSourceable> source = movies[indexPath.row];
        [cell setupWithSourceable:source];
    }
    return cell;
}

@end
