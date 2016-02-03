//
//  BaseViewController.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 2/3/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
#import "RTLabel.h"
#import "SwitchHelper.h"
#import "Movie.h"
@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic)  NSNumber * contentHight;

@end
