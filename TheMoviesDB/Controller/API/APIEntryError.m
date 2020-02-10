//
//  APIError.m
//  TheMoviesDB
//
//  Created by Anna Słupska on 09/02/2020.
//  Copyright © 2020 Anna Słupska. All rights reserved.
//

#import "APIEntryError.h"

@implementation APIEntryError

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

+ (instancetype)errorWithName:(NSString *)name {
    return [[APIEntryError alloc] initWithName:name];
}
@end
