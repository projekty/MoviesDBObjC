//
//  TMDBMovie.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 08/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "TMDBMovie.h"
#import "APIHelper.h"

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


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    APIKey apiKey = [APIHelper keyWithValue:key];
    
    switch (apiKey) {
        case APIKeyVoteCount:           [self setValue:value forKey:@"voteCount"];          break;
        case APIKeyVoteAverage:         [self setValue:value forKey:@"voteAverage"];        break;
        case APIKeyReleaseDate:         [self setValue:value forKey:@"realeaseDate"];       break;
        case APIKeyOriginalLanguage:    [self setValue:value forKey:@"originalLanguage"];   break;
        case APIKeyOriginalTitle:       [self setValue:value forKey:@"originalTitle"];      break;
        case APIKeyGenreIds:            [self setValue:value forKey:@"genreIds"];           break;
        case APIKeyBackdropPath:        [self setValue:value forKey:@"backdropPath"];       break;
        case APIKeyPosterPath:          [self setValue:value forKey:@"posterPath"];         break;
        default:                        [super setValue:value forUndefinedKey:key];         break;
    }
}

#pragma mark - DetailSourceable

- (nonnull NSNumber *)rating {
    return self.voteAverage;
}

- (nonnull NSString *)detailImagePath {
    return self.posterPath;
}

- (NSInteger)movieId {
    return self.id;
}

@end

#pragma mark -
@implementation TMDBMovie (CollectionSourceable)

- (nonnull NSString *)sourceableTitle {
    return self.title;
}

- (nonnull NSString *)sourceableSubtitle {
    return self.overview;
}

- (nullable NSString *)sourceableImagePath {
    return self.backdropPath ? self.backdropPath : self.posterPath;
}

@end
