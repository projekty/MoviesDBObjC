//
//  DetailSourceable.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 11/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#ifndef DetailSourceable_h
#define DetailSourceable_h

@protocol DetailSourceable <NSObject>

- (nonnull NSNumber *)rating;
- (nonnull NSString *)detailImagePath;

@end

#endif /* DetailSourceable_h */
