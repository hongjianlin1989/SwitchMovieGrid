//
//  FitmooHelper.h
//  fitmoo
//
//  Created by hongjian lin on 4/7/15.
//  Copyright (c) 2015 com.fitmoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH_RATIO ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)/320

#define IMAGE_URL  @"http://image.tmdb.org/t/p/w342"
#define BASE_URL  @"http://api.themoviedb.org/3/movie/now_playing?api_key=ebea8cfca72fdff8d2624ad7bbf78e4c&page="

@interface SwitchHelper : NSObject{
    
}
+ (SwitchHelper*) sharedInstance;
- (CGRect) resizeFrameWithFrame:(UIView *) view;

@end