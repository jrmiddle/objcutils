//
//  NSArray+ArrayUtils.h
//
//  Handy methods for dealing with arrays.
//
//  Created by Justin Middleton on 7/23/12.
//  Copyright (c) 2012 Justin Middleton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ArrayUtils)

// Convenience method; same as:
//
//   [NSArray arrayFromArray:array
//            executingBlock:block
//             keepNilValues:YES]

+ (NSArray *)arrayFromArray:(NSArray *)inArray executingBlock:(id (^)(id obj, BOOL *stop))filter;

- (NSArray *)arrayExecutingBlock:(id (^)(id obj, BOOL *stop))filter;

// Returns a new array that's the result of applying the filter to
// each element in inArray.
//
// If keepNilValues is YES, then nil results of filter(obj, &stop) will be
// preserved in the resulting array using NSNull as placeholders.
//
// If keepNilValues is NO, nil results of filter(obj, &stop) will not be
// preserved in the resulting array..

+ (NSArray *)arrayFromArray:(NSArray *)inArray keepNilValues:(BOOL)keepNilValues executingBlock:(id (^)(id obj, BOOL *stop))filter;

@end
