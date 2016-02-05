//
//  MovieCell.m
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [[self.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _leftView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 140,200)];
    _rightView = [[UIView alloc] initWithFrame:CGRectMake(170, 10, 140,200)];
    _leftView.frame= [[SwitchHelper sharedInstance] resizeFrameWithFrame:_leftView];
    _rightView.frame= [[SwitchHelper sharedInstance] resizeFrameWithFrame:_rightView];
    
    _leftView.clipsToBounds=YES;
    _rightView.clipsToBounds=YES;
    _leftView.backgroundColor= [UIColor lightGrayColor];
    _rightView.backgroundColor= [UIColor lightGrayColor];
    _leftView.layer.cornerRadius= 5;
    _rightView.layer.cornerRadius= 5;
    
    _movieImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, _leftView.frame.size.width,_leftView.frame.size.height)];
    _movieImage1 = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, _rightView.frame.size.width,_rightView.frame.size.height)];
    _movieImage.userInteractionEnabled = NO;
    _movieImage.exclusiveTouch = NO;
    _movieImage1.userInteractionEnabled = NO;
    _movieImage1.exclusiveTouch = NO;
    
    [self.leftView addSubview:_movieImage];
    [self.rightView addSubview:_movieImage1];
    [self.contentView addSubview:_leftView];
    [self.contentView addSubview:_rightView];
    
    
    // Initialization code
}

- (void) builtCell
{
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:_movieImage];
    [self setImageWithUrl:_movie.poster_path InImageView:_movieImage];
    [self setImageWithUrl:_movie1.poster_path InImageView:_movieImage1];
    
    _leftView.tag=_movie.movie_id.intValue;
    _rightView.tag=_movie1.movie_id.intValue;
    
}

- (void)setImageWithUrl:(NSString *)url InImageView:(AsyncImageView *)imageView
{
    imageView.imageURL =[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_URL,url]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
