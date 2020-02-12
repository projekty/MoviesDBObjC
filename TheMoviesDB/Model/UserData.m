//
//  UserData.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 12/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "UserData.h"

NSString* const FavouritesKey = @"FavouritesKey";

@interface UserData ()

@property (nonatomic, strong)  NSMutableArray<NSNumber *> *favourites;

@end

@implementation UserData

#pragma mark - Singleton

+ (instancetype)shared {
    static UserData *data;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [self new];
        data.favourites = [[NSUserDefaults standardUserDefaults] mutableArrayValueForKey:FavouritesKey];
    });
    return data;
}

#pragma mark - Favourites

- (void)changeMovie:(NSInteger)movieId {

    NSNumber *object = [NSNumber numberWithInteger:movieId];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.favourites = [defaults mutableArrayValueForKey:FavouritesKey];
    
    if (self.favourites) {
        if ([self.favourites containsObject:object]) {
            [self.favourites removeObject:object];
        } else {
            [self.favourites addObject:object];
        }
        [defaults setObject:[NSArray arrayWithArray:self.favourites] forKey:FavouritesKey];
    } else {
        [defaults setObject:[NSArray<NSNumber*> arrayWithObject:[NSNumber numberWithInteger:movieId]]
                        forKey:FavouritesKey];
    }
}

- (BOOL)isFavourite:(NSInteger)movieId {
    return [self.favourites containsObject:[NSNumber numberWithInteger:movieId]];
}

@end
