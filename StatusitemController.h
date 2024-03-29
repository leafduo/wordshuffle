//
//  StatusitemController.h
//  WordShuffle
//
//  Created by leafduo on 7/28/10.
//  Copyright 2010 leafduo.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface StatusitemController : NSObject {
	NSStatusItem *item;
	IBOutlet NSMenu *menu;
	IBOutlet NSPanel *mainWindow;
}

- (IBAction)selectFile:(id)sender;
- (IBAction)hideOrReopen:(id)sender;

@end
