//
//  APIError.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIEntryError : NSObject

@property (nonatomic, strong) NSString * _Nonnull name;

+(instancetype)errorWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

typedef void (^APIErrorBlock)(APIEntryError * _Nonnull error);
