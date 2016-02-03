//
//  ViewController.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"
#import "DetailViewController.h"
#import "BaseViewController.h"
@interface ViewController : BaseViewController


@property (strong, nonatomic) NSMutableArray *movieArray;
@property (assign, nonatomic)  int count;
@end

