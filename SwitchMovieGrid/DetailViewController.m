//
//  DetailViewController.m
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor blackColor];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate


- (UIView *) defineTableHeaderView:(UITableView *)tableView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50*SCREEN_WIDTH_RATIO)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    
    UIFont *font= [UIFont fontWithName:@"System" size:(CGFloat)(12)];
    UILabel *nameLabel=[[UILabel alloc] init];
    nameLabel.frame= CGRectMake(80, 25, 160, 21);
    nameLabel.frame= [[SwitchHelper sharedInstance] resizeFrameWithFrame:nameLabel];
    nameLabel.font=font;
    nameLabel.textColor=[UIColor lightGrayColor];
    nameLabel.text=_movie.original_title;
    nameLabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:nameLabel];
    
    UIButton * backButton= [[UIButton alloc] init];
    backButton.frame= CGRectMake(10, 25, 56, 21);
    backButton.frame= [[SwitchHelper sharedInstance] resizeFrameWithFrame:backButton];
    [backButton setTitle:@"< back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(BackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backButton];
    
    return view;
}


- (NSInteger) defineTableNumberRowsSection
{
    return 2;
}


-(UITableViewCell *)defineTableView:(UITableView *)tableView
              cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailCell *cell =(DetailCell *) [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row==0) {
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetailCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.contentView.superview.backgroundColor = [UIColor clearColor];
            cell.movie=_movie;
            [cell builtCell];
            self.contentHight=[NSNumber numberWithDouble:cell.title.frame.size.height+cell.title.frame.origin.y+10];
        }
    }
    
     if (indexPath.row==1) {
        UITableViewCell *cell= [[UITableViewCell alloc] init];
         cell.contentView.superview.backgroundColor = [UIColor clearColor];
         cell.selectionStyle=UITableViewCellSelectionStyleNone;
         RTLabel * detailLabel=[[RTLabel alloc] initWithFrame:CGRectMake(20*SCREEN_WIDTH_RATIO, 20*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
         [detailLabel setText:[NSString stringWithFormat:@"<font face='Systom' size=14 color='#FFFFFF'><p>%@</p></font>",_movie.overview]];
         [detailLabel optimumSize];
         [cell.contentView addSubview:detailLabel];
        self.contentHight=[NSNumber numberWithDouble:detailLabel.frame.size.height+detailLabel.frame.origin.y+10];
         return cell;
     }
    
    return cell;
}

- (IBAction)BackButtonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
