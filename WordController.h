//
//  WordController.h
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 leafduo.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WordPicker.h"
#import "StatusitemController.h"

@interface WordController : NSObject {
    IBOutlet NSTextField* Chinese;
    IBOutlet NSTextField* English;
	IBOutlet StatusitemController *statusitem;
	WordPicker *picker;
}

- (void)changeWord;

@end
