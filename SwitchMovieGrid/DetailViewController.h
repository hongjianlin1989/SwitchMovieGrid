//
//  DetailViewController.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "DetailCell.h"
#import "SwitchHelper.h"
#import "RTLabel.h"
@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Movie *movie;


@end
