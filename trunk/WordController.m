//
//  WordController.m
//
//  Created by leafduo on 7/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WordController.h"

@implementation WordController
- (IBAction)Change:(id)sender {
    [Chinese setStringValue:@"test"];
	[English setHidden:YES];

}
@end
