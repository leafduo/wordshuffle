//
//  WordPicker.h
//  WordShuffle
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface WordPicker : NSObject {
	NSString *chinese, *english;
	NSArray *wordList;
	NSUInteger count;
	BOOL isFileOpen;
}

@property(readonly) NSString *chinese, *english;
@property(readonly) BOOL isFileOpen;

- (void)next;

@end
