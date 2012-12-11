//
//  NSString+HasDecimalSep.m
//  Calculator
//
//  Created by Justin Middleton on 7/1/12.
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

#import "NSString+StringUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (StringUtils)

#pragma mark - searching and characterizing

- (BOOL) hasSubString:(NSString *)subString {
    NSRange subStringRange = [self rangeOfString:subString];
    return !((subStringRange.location == NSNotFound) && (subStringRange.length == 0));
}

- (BOOL) startsWithDigit
{
    NSRange range = [self rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    return ((range.location == 0) && (range.length > 0));
}

#pragma mark - joining arrays and dicts

+ (NSString *)stringByJoiningArray:(NSArray *)array
               withDelimiterString:(NSString *)delim

{
    if (array) {
        NSString *ret = @"";
        if (array.count > 0) {
            int max = array.count - 1;
                
            for (int i = 0; i < max; ++i) {
                ret = [ret stringByAppendingFormat:@"%@%@", [[array objectAtIndex:i] description], delim];
            }
            ret = [ret stringByAppendingString: [array lastObject]];
        }
        return ret;
    }
    return nil;
}

+ (NSString *)stringByJoiningDict:(NSDictionary *)dict
      withKeyValueDelimiterString:(NSString *)kvdelim
          withPairDelimiterString:(NSString *)pdelim
{
    
    NSMutableArray *pairs = [NSMutableArray arrayWithCapacity:dict.count];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [pairs addObject:[NSString stringWithFormat:@"%@%@%@", key, kvdelim, obj]];
    }];
    return [NSString stringByJoiningArray:pairs withDelimiterString:pdelim];
}

#pragma mark - hashing and crypto

/* Create an md5 hex digest of an input string.
 * Taken from http://stackoverflow.com/questions/652300/using-md5-hash-on-a-string-in-cocoa
 * apparently originally from the FB Connect library. No originality asserted.
 */

+ (NSString*)md5HexDigestString:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

- (NSString *)md5HexDigest
{
    return [NSString md5HexDigestString:self];
}

@end
