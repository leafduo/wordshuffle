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

- (void)awakeFromNib {
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Change:) userInfo:nil repeats:YES];
}
@end
