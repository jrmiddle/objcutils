//
//  NSString+HasDecimalSep.h
//  Calculator
//
//  Created by Justin Middleton on 7/1/12.
//  Copyright (c) 2012 Justin Middleton. All rights reserved.
//

@interface NSString (StringUtils)

- (BOOL) hasSubString:(NSString *)subString;
- (BOOL) startsWithDigit;
+ (NSString *) stringByJoiningArray:(NSArray *)array withDelimiterString:(NSString *)delim;

+ (NSString *) stringByJoiningDict:(NSDictionary *)dict withKeyValueDelimiterString:(NSString *)kvdelim withPairDelimiterString:(NSString *)pdelim;

+ (NSString*)md5HexDigestString:(NSString*)input;
- (NSString *)md5HexDigest;

@end
