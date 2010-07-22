//
//  WordController.m
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WordController.h"

@implementation WordController
- (void)changeWord {
	/*if (test) {
		[Chinese setStringValue:@"测试"];
		[English setStringValue:@"test"];
		test = NO;
	} else {
		[Chinese setStringValue:@"苹果"];
		[English setStringValue:@"apple"];
		test = YES;
	}*/
	
	WordPicker *picker = [WordPicker init];
	[picker next];
	[English setStringValue:[picker english]];

	[Chinese setHidden:YES];
	[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(displayTranslation) userInfo:nil repeats:NO];
}

- (void)displayTranslation {
	[Chinese setHidden:NO];
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeWord) userInfo:nil repeats:NO];
}

- (id)init {
	if (self = [super init]) {
		test = YES;
	}
	return self;
}

- (void)awakeFromNib {
	[self changeWord];
}
@end
