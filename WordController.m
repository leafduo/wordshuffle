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
	if (!paused) {
		[NSTimer scheduledTimerWithTimeInterval:englishWordDisplayTime target:self selector:@selector(displayTranslation) userInfo:nil repeats:NO];
	}
}

- (void)displayTranslation {
	[Chinese setHidden:NO];
	[NSTimer scheduledTimerWithTimeInterval:translationDisplayTime target:self selector:@selector(changeWord) userInfo:nil repeats:NO];
}

- (void)dealloc {
	[picker release];
	[[NSUserDefaultsController sharedUserDefaultsController]removeObserver:self forKeyPath:@"values.englishWordDisplayTime"];
	[[NSUserDefaultsController sharedUserDefaultsController]removeObserver:self forKeyPath:@"values.translationDisplayTime"];
	[super dealloc];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	//FIXME: should use [change objectForKey:]
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if ([keyPath isEqualToString:@"values.englishWordDisplayTime"]) {
		NSLog(@"%@", [change description]);
		englishWordDisplayTime = [defaults doubleForKey:@"englishWordDisplayTime"];
		//englishWordDisplayTime = [change objectForKey:NSKeyValueChangeNewKey]doubleValue];
		if (englishWordDisplayTime < 1.e-5) {
			englishWordDisplayTime = 3;
			[defaults setDouble:3 forKey:@"englishWordDisplayTime"];
		}
	} else if ([keyPath isEqualToString:@"values.translationDisplayTime"]) {
		NSLog(@"%@", [change description]);
		translationDisplayTime = [defaults doubleForKey:@"translationDisplayTime"];
		//translationDisplayTime = [change objectForKey:NSKeyValueChangeNewKey];
		if (translationDisplayTime < 1e-5) {
			translationDisplayTime = 2;
			[defaults setDouble:2 forKey:@"translationDisplayTime"];
		}
	}
}

- (void)hideStatusDidChange {
	if (paused) {
		[self changeWord];
		paused = NO;
	} else {
		paused = YES;
	}
}

- (void)awakeFromNib {
	paused = NO;
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
	[[NSUserDefaultsController sharedUserDefaultsController]addObserver:self forKeyPath:@"values.englishWordDisplayTime" options:NSKeyValueObservingOptionNew context:NULL];
	[[NSUserDefaultsController sharedUserDefaultsController]addObserver:self forKeyPath:@"values.translationDisplayTime" options:NSKeyValueObservingOptionNew context:NULL];
	NSString *WSHideStatusDidChangeNotification = @"WSHideStatusDidChangeNotification";
	[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideStatusDidChange) name:WSHideStatusDidChangeNotification object:nil];
	picker = [[WordPicker alloc] init];
	if (!picker.isFileOpen) {
		[statusitem selectFile:self];
	}
	[self changeWord];
}

@end
