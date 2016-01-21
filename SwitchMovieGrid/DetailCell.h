//
//  DetailCell.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "RTLabel.h"
#import "AsyncImageView.h"
#import "SwitchHelper.h"
@interface DetailCell : UITableViewCell
@property (nonatomic, retain) Movie * movie;
- (void) builtCell;

@property (nonatomic, retain) AsyncImageView *movieImage;
@property (nonatomic, retain) UIView *leftView;

@property (nonatomic, retain) RTLabel *ScoreLabel;
@property (nonatomic, retain) RTLabel *Score;
@property (nonatomic, retain) RTLabel *RatingLabel;
@property (nonatomic, retain) RTLabel *Rating;
@property (nonatomic, retain) RTLabel *ReleaseDayLabel;
@property (nonatomic, retain) RTLabel *ReleaseDay;

@property (nonatomic, retain) RTLabel *title;

@end
