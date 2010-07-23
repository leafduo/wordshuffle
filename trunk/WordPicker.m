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
	/*if (test) {
		chinese = @"测试";
		english = @"test";
		test = NO;
	} else {
		chinese = @"苹果";
		english	= @"apple";
		test = YES;
	}*/
	
	/*//bug inside
	const int MAX_LENGTH = 1000;
	char line[MAX_LENGTH + 1];
	fgets(line, MAX_LENGTH, wordFile);
	NSString *string = [NSString stringWithCString:line encoding:NSUTF8StringEncoding];*/
	

	int index = arc4random()%[wordList count];
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
		[wordList retain];
		[allWords release];
		}
	return self;
}

@synthesize chinese, english;
@end
