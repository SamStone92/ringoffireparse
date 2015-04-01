//
//  ProfileTestViewController.m
//  Ring of Fire
//
//  Created by Sam Stone on 01/04/2015.
//  Copyright (c) 2015 Olivier Gutknecht. All rights reserved.
//

#import "ProfileTestViewController.h"
#import <Parse/Parse.h>
@interface ProfileTestViewController ()

@end

@implementation ProfileTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
        // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [FBRequestConnection startForMeWithCompletionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error)
     {
         
         if (!error) {
             _facebookId = [result objectForKey:@"id"];
             
         }
         
     }];
    [FBRequestConnection
     startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
         
         
         
         
     }];
    

}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            [self loadObjects];
        

            
        }];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PFQuery *)queryForTable {
    PFUser * user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"rules"];
    [query whereKey:@"userId" equalTo:user.username];
    // If no objects are loaded in memory, we look to the cache
    // first to fill the table and then subsequently do a query
    // against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // This table displays items in the Todo class
        
        self.pullToRefreshEnabled = YES;
        self.paginationEnabled = NO;
        self.objectsPerPage = 25;
    }
    
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object {
    
    
    
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    
    cell.detailTextLabel.numberOfLines = 0;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"cell"];
        
        [cell.detailTextLabel setNumberOfLines:0]; // unlimited number of lines
        [cell.detailTextLabel setLineBreakMode:UILineBreakModeWordWrap];
        [cell.detailTextLabel setFont:[UIFont systemFontOfSize: 14.0]];
    }
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Black" size:25.0f];
    cell.textLabel.text = [object objectForKey:@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Downloads: %@",[object objectForKey:@"downloads"]];
    
    
    
    
    
    
    return cell;
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
