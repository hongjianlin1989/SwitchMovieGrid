//
//  DetailViewController.m
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
       NSNumber * contentHight;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor blackColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 50.0f*SCREEN_WIDTH_RATIO;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView
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
            contentHight=[NSNumber numberWithDouble:cell.title.frame.size.height+cell.title.frame.origin.y+10];
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
         contentHight=[NSNumber numberWithDouble:detailLabel.frame.size.height+detailLabel.frame.origin.y+10];
         return cell;
     }
    
    
    return cell;
}

- (IBAction)BackButtonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    NSNumber *height=contentHight;
    return height.integerValue;
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
