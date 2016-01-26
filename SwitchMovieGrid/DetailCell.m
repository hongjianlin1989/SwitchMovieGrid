//
//  DetailCell.m
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell

- (void)awakeFromNib {
    
    [[self.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _leftView = [[AsyncImageView alloc] initWithFrame:CGRectMake(20, 30, 140,200)];
    _leftView.frame= [[SwitchHelper sharedInstance] resizeFrameWithFrame:_leftView];
    _leftView.backgroundColor= [UIColor lightGrayColor];
    _leftView.clipsToBounds=YES;

    _movieImage = [[AsyncImageView alloc] initWithFrame:CGRectMake(0, 0, _leftView.frame.size.width,_leftView.frame.size.height)];
    _leftView.layer.cornerRadius= 5;
    _movieImage.userInteractionEnabled = NO;
    _movieImage.exclusiveTouch = NO;
    
    [self.leftView addSubview:_movieImage];
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    // Initialization code
}

- (void) builtCell
{
    
    NSString *moviePath=_movie.poster_path;
    if ([moviePath isEqual:[NSNull null]]) {
        moviePath=_movie.backdrop_path;
    }
    _movieImage.imageURL =[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://image.tmdb.org/t/p/w342",moviePath]];
    _movieImage.contentMode = UIViewContentModeScaleAspectFill;
    
    _ScoreLabel=[[RTLabel alloc] initWithFrame:CGRectMake(180*SCREEN_WIDTH_RATIO, 20*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_ScoreLabel setText:[NSString stringWithFormat:@"<font face=Systom size=14 color='#FFFFFF'><p>%@</p></font>",@"Score:"]];
    [_ScoreLabel optimumSize];
    
    _Score=[[RTLabel alloc] initWithFrame:CGRectMake(180*SCREEN_WIDTH_RATIO, 40*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_Score setText:[NSString stringWithFormat:@"<a href=''><font face='HelveticaNeue-CondensedBold' size=14 color='#FFFFFF'><p>%@   </p></font></a>",_movie.vote_average]];
    [_Score optimumSize];
    
   
    _RatingLabel=[[RTLabel alloc] initWithFrame:CGRectMake(180*SCREEN_WIDTH_RATIO, 80*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_RatingLabel setText:[NSString stringWithFormat:@"<a href=''><font face=Systom size=14 color='#FFFFFF'><p>%@</p></font></a>",@"Voting Count:"]];
    [_RatingLabel optimumSize];
    
    _Rating=[[RTLabel alloc] initWithFrame:CGRectMake(180*SCREEN_WIDTH_RATIO, 100*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_Rating setText:[NSString stringWithFormat:@"<a href=''><font face='HelveticaNeue-CondensedBold' size=14 color='#FFFFFF'><p>%@</p></font></a>",_movie.vote_count]];
    [_RatingLabel optimumSize];
    
    
    _ReleaseDayLabel=[[RTLabel alloc] initWithFrame:CGRectMake(180*SCREEN_WIDTH_RATIO, 140*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_ReleaseDayLabel setText:[NSString stringWithFormat:@"<a href=''><font face=Systom size=14 color='#FFFFFF'><p>%@</p></font></a>",@"Release Day:"]];
    [_ReleaseDayLabel optimumSize];
    
    _ReleaseDay=[[RTLabel alloc] initWithFrame:CGRectMake(180*SCREEN_WIDTH_RATIO, 160*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_ReleaseDay setText:[NSString stringWithFormat:@"<a href=''><font face='HelveticaNeue-CondensedBold' size=14 color='#FFFFFF'><p>%@</p></font></a>",_movie.release_date]];
    [_ReleaseDay optimumSize];
    
    
    _title=[[RTLabel alloc] initWithFrame:CGRectMake(20*SCREEN_WIDTH_RATIO, 230*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_title setText:[NSString stringWithFormat:@"<a href=''><font face='HelveticaNeue-CondensedBold' size=30 color='#FFFFFF'><p>%@</p></font></a>",_movie.title]];
     CGSize optimumSize =[_title optimumSize];
    _title.frame=CGRectMake(_title.frame.origin.x, _title.frame.origin.y, optimumSize.width, optimumSize.height+10);
    
  
    [self.contentView addSubview:_leftView];
    [self.contentView addSubview:_ScoreLabel];
    [self.contentView addSubview:_Score];
    [self.contentView addSubview:_Rating];
    [self.contentView addSubview:_RatingLabel];
    [self.contentView addSubview:_ReleaseDay];
    [self.contentView addSubview:_ReleaseDayLabel];
    [self.contentView addSubview:_title];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
