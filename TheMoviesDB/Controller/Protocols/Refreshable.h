//
//  Favouritable.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 12/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Refreshable <NSObject>

- (void)needToRfreshUserDefaults;

@end
NS_ASSUME_NONNULL_END
