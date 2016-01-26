//
//  ViewController.m
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()
{
    NSNumber * contentHight;
    NSInteger page;
    double FrameRate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
    [self initValues];
    [self getMoviesFromUrl];
    FrameRate= SCREEN_WIDTH_RATIO;
}




- (void) initValues
{
     page=1;
    _movieArray= [[NSMutableArray alloc] init];
}


- (void) parseMovie:(NSDictionary *) dic
{
    
    NSArray *results= [dic objectForKey:@"results"];
    for (NSDictionary *res in results) {
        
        Movie *movie= [[Movie alloc] init];
        movie.poster_path= [res objectForKey:@"poster_path"];
        NSNumber *movie_id= [res objectForKey:@"id"];
        movie.movie_id=movie_id.stringValue;
        NSNumber *vote_average= [res objectForKey:@"vote_average"];
        movie.vote_average= vote_average.stringValue;
        movie.backdrop_path= [res objectForKey:@"backdrop_path"];
        movie.release_date= [res objectForKey:@"release_date"];
        NSNumber *vote_count= [res objectForKey:@"vote_count"];
        movie.vote_count= vote_count.stringValue;
        movie.title= [res objectForKey:@"title"];
        movie.overview= [res objectForKey:@"overview"];
        movie.original_title= [res objectForKey:@"original_title"];
        
        [_movieArray addObject:movie];
        
    }
    [self.tableView reloadData];
    
}

- (void) getMoviesFromUrl
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *url= [NSString stringWithFormat:@"%@%li",BASE_URL,page];
    
    [manager GET: url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSDictionary * responseDic= responseObject;
        [self parseMovie:responseDic];
    } // success callback block
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@"Error: %@", error);} // failure callback block
    ];
    
}


#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f*FrameRate;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 45*FrameRate)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    UIFont *font= [UIFont fontWithName:@"System" size:(CGFloat)(12)];
    UILabel *nameLabel=[[UILabel alloc] init];
    nameLabel.frame= CGRectMake(80, 25, 160, 21);
    nameLabel.frame= [[SwitchHelper sharedInstance] resizeFrameWithFrame:nameLabel];
    nameLabel.font=font;
    nameLabel.textColor=[UIColor lightGrayColor];
    nameLabel.text=@"Latest Movies";
    nameLabel.textAlignment=NSTextAlignmentCenter;
    
    [view addSubview:nameLabel];
    return view;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    
    NSInteger count=[_movieArray count]/2;
    count= (count%2==0)? count : count+1;
    return count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieCell *cell =(MovieCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
        cell.movie=[_movieArray objectAtIndex:indexPath.row*2];
        cell.movie1=[_movieArray objectAtIndex:indexPath.row*2+1];
        [cell builtCell];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MovieTagClick:)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [cell.leftView addGestureRecognizer:tapGestureRecognizer];
        cell.leftView.userInteractionEnabled=YES;

        UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MovieTagClick:)];
        tapGestureRecognizer1.numberOfTapsRequired = 1;
        [cell.rightView addGestureRecognizer:tapGestureRecognizer1];
        cell.rightView.userInteractionEnabled=YES;
        
        contentHight=[NSNumber numberWithDouble:cell.movieImage.frame.size.height+10];
    }

    return cell;
}

- (IBAction)MovieTagClick:(id)sender {
    UIView *myView = (UIView *)[(UIGestureRecognizer *)sender view];
    NSString *selected_id=[NSString stringWithFormat:@"%ld",myView.tag];
    
    for (Movie *m in _movieArray) {
        if ([m.movie_id isEqualToString:selected_id]) {
            UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            DetailViewController *detailView = [mainStoryboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
            detailView.movie=m;
            [self presentViewController:detailView animated:YES completion:nil];
        }
    }
    
    
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return contentHight.integerValue;
}



- (void)scrollViewDidScroll: (UIScrollView*)scroll {
    
    if(self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height-300)) {
        if (_count==0) {
            page++;
            [self getMoviesFromUrl];
        }
        _count++;
    }else
    {
        _count=0;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
