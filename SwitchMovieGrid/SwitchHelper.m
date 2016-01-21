//
//  FitmooHelper.m
//  fitmoo
//
//  Created by hongjian lin on 4/7/15.
//  Copyright (c) 2015 com.fitmoo. All rights reserved.
//

#import "SwitchHelper.h"

@implementation SwitchHelper

+ (SwitchHelper*)sharedInstance
{
    static dispatch_once_t pred;
    static SwitchHelper *settings = nil;
    
    dispatch_once(&pred, ^{ settings = [[self alloc] init]; });
    return settings;
    
}


- (CGRect) resizeFrameWithFrame:(UIView *) view  respectToSuperFrame: (UIView *) superView
{
    if (superView!=nil) {
        double Ratio= superView.frame.size.width / 320;
        _frameRatio=Ratio;
        view.frame= CGRectMake(view.frame.origin.x * Ratio, view.frame.origin.y * Ratio, view.frame.size.width * Ratio, view.frame.size.height*Ratio);
    }else
    {
        view.frame= CGRectMake(view.frame.origin.x * _frameRatio, view.frame.origin.y * _frameRatio, view.frame.size.width * _frameRatio, view.frame.size.height*_frameRatio);
    }
    
    return view.frame;
}




- (id) init;{
    
    if ((self = [super init])) {
    }
    

    
    
    return self;
}


@end