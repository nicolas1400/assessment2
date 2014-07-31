//
//  ClickeableLabel.m
//  assessment2
//
//  Created by Nicolas Semenas on 31/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "ClickeableLabel.h"

@implementation ClickeableLabel

-(IBAction)onTapped:(id)sender{

    NSLog(@"Show in wikipedia");
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
