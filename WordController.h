//
//  WordController.h
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WordPicker.h"

@interface WordController : NSObject {
    IBOutlet NSTextField* Chinese;
    IBOutlet NSTextField* English;
	WordPicker *picker;
}

- (void)changeWord;

@property (retain) NSTextField* Chinese;
@property (retain) NSTextField* English;
@property BOOL test;
@end
