//
//  TMDBMovie.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBMovie.h"

@interface TMDBMovie ()

@property (nonatomic, strong) NSString * _Nullable posterPath;
@property (nonatomic, assign) BOOL adult;
@property (nonatomic, strong) NSString * _Nonnull overview;
@property (nonatomic, strong) NSString * _Nonnull realeaseDate;
@property (nonatomic, strong) NSArray<NSNumber*> * _Nonnull genreIds;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString * _Nonnull originalTitle;
@property (nonatomic, strong) NSString * _Nonnull originalLanguage;
@property (nonatomic, strong) NSString * _Nonnull title;
@property (nonatomic, strong) NSString * _Nullable backdropPath;
@property (nonatomic, strong) NSString * _Nonnull popularity;
@property (nonatomic, assign) NSInteger voteCount;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, strong) NSNumber *voteAverage;

@end


@implementation TMDBMovie

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
