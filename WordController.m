//
//  WordController.m
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 leafduo.com. All rights reserved.
//

#import "WordController.h"

@implementation WordController
- (void)changeWord {
	[picker next];
	[English setStringValue:picker.english];
	[Chinese setStringValue:picker.chinese];
	
	[Chinese setHidden:YES];
	[NSTimer scheduledTimerWithTimeInterval:englishWordDisplayTime target:self selector:@selector(displayTranslation) userInfo:nil repeats:NO];
}

- (void)displayTranslation {
	[Chinese setHidden:NO];
	[NSTimer scheduledTimerWithTimeInterval:translationDisplayTime target:self selector:@selector(changeWord) userInfo:nil repeats:NO];
}

- (void)dealloc {
	[picker release];
	[super dealloc];
}

- (void)awakeFromNib {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	englishWordDisplayTime = [defaults doubleForKey:@"englishWordDisplayTime"];
	translationDisplayTime = [defaults doubleForKey:@"translationDisplayTime"];
	if (englishWordDisplayTime < 1e-5) {
		englishWordDisplayTime = 3;
		[defaults setDouble:3 forKey:@"englishWordDisplayTime"];
	}
	if (translationDisplayTime < 1e-5) {
		translationDisplayTime = 2;
		[defaults setDouble:2 forKey:@"translationDisplayTime"];
	}
	picker = [[WordPicker alloc] init];
	if (!picker.isFileOpen) {
		[statusitem selectFile:self];
	}
	[self changeWord];
}

@end
