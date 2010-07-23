//
//  WordPicker.h
//  WordShuffle
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface WordPicker : NSObject {
	//BOOL test;
	NSString *chinese, *english;
	NSArray *wordList;
}

@property(readonly) NSString *chinese, *english;

- (void)next;

@end
