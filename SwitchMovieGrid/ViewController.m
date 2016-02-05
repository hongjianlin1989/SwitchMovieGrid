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
    NSInteger page;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initValues];
    [self getMoviesFromUrl];
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


#pragma mark - UITableViewDelegate OverWrite
- (NSInteger) defineTableNumberRowsSection
{
        NSInteger count=[_movieArray count]/2;
        count= (count%2==0)? count : count+1;
        return count;
}

-(UITableViewCell *)defineTableView:(UITableView *)tableView
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
    
     
            [cell.leftView addGestureRecognizer:[self generateUITapGestureRecognizer]];
            [cell.rightView addGestureRecognizer:[self generateUITapGestureRecognizer]];
       
    
            self.contentHight=[NSNumber numberWithDouble:cell.movieImage.frame.size.height+10];
        }
    
        return cell;
}

- (UITapGestureRecognizer *)generateUITapGestureRecognizer
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MovieTagClick:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    return tapGestureRecognizer;
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
