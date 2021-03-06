//
//  ProfileViewController.m
//  Ring of Fire
//
//  Created by Sam Stone on 11/03/2015.
//  Copyright (c) 2015 Olivier Gutknecht. All rights reserved.
//

#import "ProfileViewController.h"
#import <ParseUI/ParseUI.h>
@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet PFQueryTableViewController *tableView;
@property (strong, nonatomic) PFObject *userRules;

@end
NSMutableArray * ruleTitle;
@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block NSString *facebookId;
    
    PFUser * user = [PFUser currentUser];
    [FBRequestConnection startForMeWithCompletionHandler:
     ^(FBRequestConnection *connection, id result, NSError *error)
     {
   
         if (!error) {
             facebookId = [result objectForKey:@"id"];
             NSURL *profilePictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", result[@"id"]]];
             NSURLRequest *profilePictureURLRequest = [NSURLRequest requestWithURL:profilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f]; // Facebook profile picture cache policy: Expires in 2 weeks
             [NSURLConnection connectionWithRequest:profilePictureURLRequest delegate:self];
             
             NSLog(@"%@", profilePictureURL);
             
             NSData *imageData = [NSData dataWithContentsOfURL:profilePictureURL];
             _profilePic.image = [UIImage imageWithData:imageData];
             _userName.text = [result objectForKey:@"name"];
         }

     }];
    [FBRequestConnection
     startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
         
        
     
     
     }];
      // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"rules"];
    
    // If no objects are loaded in memory, we look to the cache
    // first to fill the table and then subsequently do a query
    // against the network.
    [query whereKey:@"userId" equalTo:@"Dan Stemkoski"];    
    [query orderByDescending:@"createdAt"];
    
    return query;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
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
    cell.detailTextLabel.text = [object objectForKey:@"title"];
    

    
    
    
    
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
