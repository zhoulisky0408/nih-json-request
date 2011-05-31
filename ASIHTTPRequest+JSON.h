//
//  ASIHTTPRequest+JSON.h
//
//  Created by Scott James Remnant on 5/31/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"


@interface ASIHTTPRequest (ASIHTTPRequest_JSON)

/// Returns the NSDictionary or NSArray represented by the receiver's JSON representation, or nil on error
- (id)responseJSON;

@end
