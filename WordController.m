//
//  WordController.m
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WordController.h"
#import "WordPicker.h"

@implementation WordController
- (void)changeWord {
	[picker next];
	[English setStringValue:picker.english];
	[Chinese setStringValue:picker.chinese];
	
	[Chinese setHidden:YES];
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(displayTranslation) userInfo:nil repeats:NO];
}

- (void)displayTranslation {
	NSLog(@"Here");
	[Chinese setHidden:NO];
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeWord) userInfo:nil repeats:NO];
}

- (id)init {
	if (self = [super init]) {
		picker = [[WordPicker alloc] init];
	}
	return self;
}

- (void)dealloc {
	[picker release];
	[super dealloc];
}

- (void)awakeFromNib {
	[self changeWord];
}

@end
