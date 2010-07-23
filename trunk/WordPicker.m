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
	if (test) {
		chinese = @"测试";
		english = @"test";
		test = NO;
	} else {
		chinese = @"苹果";
		english	= @"apple";
		test = YES;
	}
}

- (id)init {
	if (self = [super init]) {
		test = YES;
	}
	return self;
}

@synthesize chinese, english;
@end
