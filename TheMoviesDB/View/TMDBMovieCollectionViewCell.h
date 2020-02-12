//
//  TMDBMovieCollectionViewCell.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 10/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionSourceable.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMDBMovieCollectionViewCell : UICollectionViewCell

+ (NSString *)identifier;

- (void)setupWithSourceable:(id<CollectionSourceable>)sourceable;
- (void)refreshFavourite;

@end

NS_ASSUME_NONNULL_END
