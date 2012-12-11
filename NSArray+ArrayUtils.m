//
//  NSArray+ArrayUtils.m
//  TopPlaces
//
//  Created by Justin Middleton on 7/23/12.
//  Copyright (c) 2012 Justin Middleton. All rights reserved.
//

#import "NSArray+ArrayUtils.h"

@implementation NSArray (ArrayUtils)

+ (NSArray *)arrayFromArray:(NSArray *)inArray executingBlock:(id (^)(id obj, BOOL *stop))filter
{
    return [self arrayFromArray:inArray keepNilValues:YES executingBlock:filter];
}

- (NSArray *)arrayExecutingBlock:(id (^)(id obj, BOOL *stop))filter
{
    return [NSArray arrayFromArray:self executingBlock:filter];
}

+ (NSArray *)arrayFromArray:(NSArray *)inArray keepNilValues:(BOOL)keepNilValues executingBlock:(id (^)(id obj, BOOL *stop))filter
{
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:inArray.count];
    BOOL stop = NO;
    
    for (id obj in inArray) {
        if (stop) break;
        id newObj = filter(obj, &stop);

        if (newObj != nil) {
            [ret addObject:newObj];
        } else if (keepNilValues) {
            [ret addObject:[NSNull null]];
        }
    }
    return ret;
}

@end
