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
	
	//bug inside
	const int MAX_LENGTH = 1000;
	char line[MAX_LENGTH + 1];
	fgets(line, MAX_LENGTH, wordFile);
	NSString *string = [NSString stringWithCString:line encoding:NSUTF8StringEncoding];
	NSArray *wordArray = [string componentsSeparatedByString:@"#"];
	english = [wordArray objectAtIndex:1];
	chinese = [wordArray objectAtIndex:2];
}

- (id)init {
	if (self = [super init]) {
		//test = YES;
		wordFile = fopen("word.txt", "r");
		if (!wordFile) {
			NSLog(@"I hate YOU");
			exit(-1);
		}
	}
	return self;
}

@synthesize chinese, english;
@end
