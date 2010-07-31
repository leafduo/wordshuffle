//
//  StatusitemController.m
//  WordShuffle
//
//  Created by leafduo on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StatusitemController.h"


@implementation StatusitemController

- (void)addAppAsLoginItem {
	NSString * appPath = [[NSBundle mainBundle] bundlePath];
	
	// This will retrieve the path for the application
	// For example, /Applications/test.app
	CFURLRef url = (CFURLRef)[NSURL fileURLWithPath:appPath]; 
	
	// Create a reference to the shared file list.
	// We are adding it to the current user only.
	// If we want to add it all users, use
	// kLSSharedFileListGlobalLoginItems instead of
	//kLSSharedFileListSessionLoginItems
	LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL,
															kLSSharedFileListSessionLoginItems, NULL);
	if (loginItems) {
		//Insert an item to the list.
		LSSharedFileListItemRef listItem = LSSharedFileListInsertItemURL(loginItems,
																	 kLSSharedFileListItemLast, NULL, NULL,
																	 url, NULL, NULL);
		if (listItem){
			CFRelease(listItem);
		}
	}	
	
	CFRelease(loginItems);
}

- (void)deleteAppFromLoginItem {
	NSString * appPath = [[NSBundle mainBundle] bundlePath];
	
	// This will retrieve the path for the application
	// For example, /Applications/test.app
	CFURLRef url = (CFURLRef)[NSURL fileURLWithPath:appPath]; 
	
	// Create a reference to the shared file list.
	LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL,
															kLSSharedFileListSessionLoginItems, NULL);
	
	if (loginItems) {
		UInt32 seedValue;
		//Retrieve the list of Login Items and cast them to
		// a NSArray so that it will be easier to iterate.
		NSArray  *loginItemsArray = (NSArray *)LSSharedFileListCopySnapshot(loginItems, &seedValue);
		for(int i = 0 ; i < [loginItemsArray count]; i++){
			LSSharedFileListItemRef itemRef = (LSSharedFileListItemRef)[loginItemsArray
																		objectAtIndex:i];
			//Resolve the item with URL
			if (LSSharedFileListItemResolve(itemRef, 0, (CFURLRef*) &url, NULL) == noErr) {
				NSString * urlPath = [(NSURL*)url path];
				if ([urlPath compare:appPath] == NSOrderedSame){
					LSSharedFileListItemRemove(loginItems,itemRef);
				}
			}
		}
		[loginItemsArray release];
	}
}

- (void)awakeFromNib {
	[self addAppAsLoginItem];
	item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[item retain];
	NSBundle *bundle = [NSBundle mainBundle];
	NSImage *icon = [[NSImage alloc]initWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
	[item setImage:icon];
	//[item setTitle:@"WS"];
	[item setHighlightMode:YES];
	[item setMenu:menu];
}

- (IBAction)selectFile:(id)sender {
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel beginSheetModalForWindow:mainWindow completionHandler:^(NSInteger result) {
		if (result == NSFileHandlingPanelOKButton) {
			NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
			[defaults setURL:[openPanel URL] forKey:@"wordFilePath"];
		}
	}];
}

- (IBAction)hideOrReopen:(id)sender {
	if ([mainWindow isVisible]) {
		[mainWindow close];
	} else {
		[mainWindow orderFront:self];
	}
}

@end
