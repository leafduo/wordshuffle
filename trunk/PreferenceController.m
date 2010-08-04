//
//  PreferenceController.m
//  WordShuffle
//
//  Created by leafduo on 8/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PreferenceController.h"


@implementation PreferenceController

- (BOOL)isStartupAtLogin {
	return YES;
}

- (IBAction)startUpAtLoginChanged:(id)sender {
	NSLog(@"startUpAtLoginChanged called");
}

- (IBAction)displayPreferenceWindow:(id)sender {
	NSLog(@"displayPreferenceWindow called");
	if (!preferenceWindowController) {
		[NSBundle loadNibNamed:@"Preferences" owner:self];
		preferenceWindowController = [[NSWindowController alloc]initWithWindow:preferenceWindow];
	}
	NSLog(@"preferenceWindowController: %@", preferenceWindowController);
	NSLog(@"preferenceWindow: %@", preferenceWindow);
	[preferenceWindowController showWindow:self];
	[preferenceWindow orderFront:self];
}

@end
