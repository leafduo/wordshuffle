//
//  PreferenceController.h
//  WordShuffle
//
//  Created by leafduo on 8/4/10.
//  Copyright 2010 leafduo.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PreferenceController : NSObject {
	IBOutlet NSButton *startUpAtLogin;
	IBOutlet NSWindow *preferenceWindow;
}

- (IBAction)startUpAtLoginChanged:(id)sender;
- (IBAction)displayPreferenceWindow:(id)sender;

@end
