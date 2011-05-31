//
//  NIHJSONRequest.m
//
//  Created by Scott James Remnant on 5/31/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import "NIHJSONRequest.h"

#import "JSON.h"


@implementation NIHJSONRequest

@synthesize postObject;
@synthesize stringEncoding;


#pragma mark -
#pragma mark Intialization

+ (id)requestWithURL:(NSURL *)newURL
{
    return [[[self alloc] initWithURL:newURL] autorelease];
}

- (id)initWithURL:(NSURL *)newURL
{
    if ((self = [super initWithURL:newURL])) {
        self.stringEncoding = NSUTF8StringEncoding;
    }
    return self;
}


#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    NIHJSONRequest *newRequest = [super copyWithZone:zone];
    [newRequest setPostObject:self.postObject];
    [newRequest setStringEncoding:self.stringEncoding];
    [newRequest setRequestMethod:self.requestMethod];
    return newRequest;
}


#pragma mark -
#pragma mark ASIHTTPRequest post body override

- (void)buildPostBody
{
    if (self.haveBuiltPostBody)
        return;
    
    if (self.postObject) {
        NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName (CFStringConvertNSStringEncodingToEncoding (self.stringEncoding));
        [self addRequestHeader:@"Content-Type" value:[NSString stringWithFormat:@"application/json; charset=%@", charset]];
        
        [super appendPostData:[[postObject JSONRepresentation] dataUsingEncoding:self.stringEncoding]];
    }
    
    [super buildPostBody];
}


#pragma mark -
#pragma mark Memory handling

- (void)dealloc
{
    [postObject release];
    [super dealloc];
}

@end
