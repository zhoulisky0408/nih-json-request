//
//  NIHJSONRequest+OAuth.m
//
//  Created by Scott James Remnant on 6/3/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "NSData+Base64.h"
#import "NIHJSONRequest+OAuth.h"


@implementation NIHJSONRequest (NIHJSONRequest_OAuth)

- (NSArray *)oauthAdditionalParametersForMethod:(ASIOAuthSignatureMethod)signatureMethod
{
    if (signatureMethod == ASIOAuthPlaintextSignatureMethod)
        return nil;

    unsigned char digestBytes[CC_SHA1_DIGEST_LENGTH];    
    CC_SHA1([[self postBody] bytes], [[self postBody] length], digestBytes);

    NSData *digestData = [NSData dataWithBytes:digestBytes length:CC_SHA1_DIGEST_LENGTH];
    NSString *digest = [digestData base64EncodedString];

    return [NSArray arrayWithObject:[NSDictionary dictionaryWithObjectsAndKeys:@"oauth_body_hash", @"key", digest, @"value", nil]];
}

@end
