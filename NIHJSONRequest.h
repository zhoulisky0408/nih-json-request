//
//  NIHJSONRequest.h
//
//  Created by Scott James Remnant on 5/31/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequest+JSON.h"

@interface NIHJSONRequest : ASIHTTPRequest <NSCopying> {
    // Object that will be POSTed to the URL in JSON format
    NSObject *postObject;
    
    NSStringEncoding stringEncoding;
}

@property (retain) NSObject *postObject;
@property (assign) NSStringEncoding stringEncoding;

@end
