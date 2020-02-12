//
//  CollectionSourceable.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#ifndef CollectionSourceable_h
#define CollectionSourceable_h

@protocol CollectionSourceable <NSObject>

- (NSInteger)movieId;
- (nonnull NSString *)sourceableTitle;
- (nonnull NSString *)sourceableSubtitle;

@optional
- (nullable NSString *)sourceableImagePath;

@end
#endif /* CollectionSourceable_h */

