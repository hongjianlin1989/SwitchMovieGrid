//
//  MovieCell.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AsyncImageView.h"
#import "SwitchHelper.h"
@interface MovieCell : UITableViewCell


@property (nonatomic, retain) Movie * movie;
@property (nonatomic, retain) Movie * movie1;

@property (nonatomic, retain) AsyncImageView *movieImage;
@property (nonatomic, retain) AsyncImageView *movieImage1;

@property (nonatomic, retain) UIView *leftView;
@property (nonatomic, retain) UIView *rightView;

- (void) builtCell;
@end
