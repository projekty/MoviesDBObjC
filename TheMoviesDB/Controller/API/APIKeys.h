//
//  APIKeys.h
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#ifndef APIKeys_h
#define APIKeys_h

typedef NS_ENUM(NSInteger, APIKey) {
    APIKeyNone,
    APIKeyStatusMessage,
    APIKeyErrors,
    APIKeyResult,
    APIKeyDates,
    APIKeyVoteCount,
    APIKeyVoteAverage,
    APIKeyReleaseDate,
    APIKeyOriginalLanguage,
    APIKeyOriginalTitle,
    APIKeyGenreIds,
    APIKeyBackdropPath,
    APIKeyPosterPath,
    APIKeyTotalPages,
    APIKeyTotalResults,
    APIKeyBackdropSizes,
    APIKeyImages,
    APIKeyPosterSizes,
    APISecureBaseURL,
    APIKeyCount,
};

#endif /* APIKeys_h */
