//
//  WordPicker.m
//  WordShuffle
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 leafduo.com. All rights reserved.
//

#import "WordPicker.h"


@implementation WordPicker

- (void)next {
	if (!isFileOpen) {
		english = NSLocalizedString(@"No file selected.", nil);
		chinese = @"";
		return;
	}
	NSUInteger index = arc4random()%count;
	NSString *string = [wordList objectAtIndex:index];
	NSArray *wordArray = [string componentsSeparatedByString:@"#"];
	[english release];
	english = [[NSString alloc] initWithString:[wordArray objectAtIndex:1]];
	NSLog(@"%@", english);
	[chinese release];
	chinese = [[NSString alloc] initWithString:[wordArray objectAtIndex:2]];
	NSLog(@"%@", chinese);
}

- (void)readWordFile {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSURL *url = [defaults URLForKey:@"wordFilePath"];
	if (url == nil)
		isFileOpen = NO;
	else
		isFileOpen = YES;
	NSLog(@"URL: %@", [url path]);
	NSString *allWords = [[NSString alloc] initWithContentsOfFile:[url path] encoding:NSUTF8StringEncoding error:nil];
	[wordList release];
	wordList = [allWords componentsSeparatedByString:@"\n"];
	[wordList retain];
	[allWords release];
	count = [wordList count];
}

- (void)wordFileDidChange:(NSNotification *)notification {
	NSLog(@"wordFileDidChange called");
	[self readWordFile];
}

- (id)init {
	if (self = [super init]) {
		[self readWordFile];
		NSString *WSWordFileChangedNotification = @"WSWordFileChangedNotification";
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(wordFileDidChange:) name:WSWordFileChangedNotification object:nil];
		}
	return self;
}

@synthesize chinese, english, isFileOpen;
@end
