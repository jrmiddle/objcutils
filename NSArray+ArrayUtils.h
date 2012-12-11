//
//  NSArray+ArrayUtils.h
//
//  Handy methods for dealing with arrays.
//
//  Created by Justin Middleton on 7/23/12.
//  Copyright (c) 2012, Justin R. Middleton<jrmiddle@gmail.com>
//  All rights reserved.
//  
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met: 
//  
//  1. Redistributions of source code must retain the above copyright notice, this
//     list of conditions and the following disclaimer. 
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution. 
//  
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
//  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//  
//  The views and conclusions contained in the software and documentation are those
//  of the authors and should not be interpreted as representing official policies, 
//  either expressed or implied, of the FreeBSD Project.

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
