//
//  WordPicker.m
//  WordShuffle
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WordPicker.h"


@implementation WordPicker

- (void)next {
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

- (id)init {
	if (self = [super init]) {
		NSString *allWords = [[NSString alloc] initWithContentsOfFile:@"word.txt" encoding:NSUTF8StringEncoding error:nil];
		wordList = [allWords componentsSeparatedByString:@"\n"];
		count = [wordList count];
		[wordList retain];
		[allWords release];
		}
	return self;
}

@synthesize chinese, english;
@end
