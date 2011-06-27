//
//  ASIHTTPRequest+JSON.m
//
//  Created by Scott James Remnant on 5/31/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import "ASIHTTPRequest+JSON.h"
#import "SBJson.h"


@implementation ASIHTTPRequest (ASIHTTPRequest_JSON)

- (id)responseJSON
{
    return [[self responseString] JSONValue];
}

@end
