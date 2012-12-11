//
//  NSString+HasDecimalSep.m
//  Calculator
//
//  Created by Justin Middleton on 7/1/12.
//  Copyright (c) 2012 Justin Middleton. All rights reserved.
//

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
