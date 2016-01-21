//
//  ViewController.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"
#import "Movie.h"
#import "AsyncImageView.h"
#import "RTLabel.h"
#import "DetailViewController.h"
#import "SwitchHelper.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *movieArray;
@property (assign, nonatomic)  int count;
@end

