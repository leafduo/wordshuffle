//
//  WordController.m
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WordController.h"

@implementation WordController
- (void)changeWord {
	[picker next];
	[English setStringValue:picker.english];
	[Chinese setStringValue:picker.chinese];
	
	[Chinese setHidden:YES];
	[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(displayTranslation) userInfo:nil repeats:NO];
}

- (void)displayTranslation {
	[Chinese setHidden:NO];
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeWord) userInfo:nil repeats:NO];
}

- (void)dealloc {
	[picker release];
	[super dealloc];
}

- (void)awakeFromNib {
	picker = [[WordPicker alloc] init];
	if (!picker.isFileOpen) {
		[statusitem selectFile:self];
	}
	[self changeWord];
}

@end
