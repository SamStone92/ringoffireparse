//
//  table.m
//  Ring of Fire
//
//  Created by Sam Stone on 13/12/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "table.h"
#import <Parse/Parse.h>
#import "EDStarRating.h"
#import "RuleSetViewController.h"

@implementation table

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

- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:@"rules"];
    
    // If no objects are loaded in memory, we look to the cache
    // first to fill the table and then subsequently do a query
    // against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        object:(PFObject *)object {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    self.colors = @[ [UIColor colorWithRed:0.11f green:0.38f blue:0.94f alpha:1.0f], [UIColor colorWithRed:1.0f green:0.22f blue:0.22f alpha:1.0f], [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f], [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f]];

    // Configure the cell to show todo item with a priority at the bottom
    cell.textLabel.text = [object objectForKey:@"title"];
    cell.detailTextLabel.text = [object objectForKey:@"addedBy"];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Avenir" size:14.0f];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Black" size:25.0f];
    cell.imageView.image = [UIImage imageNamed:@"ace_of_spades.png"];
    CGSize itemSize = CGSizeMake(60, 80);
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

        
    

    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect frame = tableView.frame;
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-60, 10, 50, 30)];
    addButton.titleLabel.text = @"+";
    addButton.backgroundColor = [UIColor redColor];
     addButton.font = [UIFont fontWithName:@"Avenir-Black" size:18.0f];
    [addButton addTarget:self
                 action:@selector(showMenu)
       forControlEvents:UIControlEventTouchUpInside];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    title.text = @"Sort By:";
     title.font = [UIFont fontWithName:@"Avenir-Black" size:18.0f];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+50)];
    [headerView addSubview:title];
    [headerView addSubview:addButton];
    headerView.backgroundColor = [UIColor grayColor];
    
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Check that a new transition has been requested to the DetailViewController and prepares for it
    if ([segue.identifier isEqualToString:@"ruleDetail"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RuleSetViewController *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];

        destViewController.rules = object;
    }
}

-(void)showMenu{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Sort rules by:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Highest Rated",
                            @"Newest",
                            @"Popular",
                           
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                  
                    break;
                case 1:
                    
                    break;
                case 2:
                 
                    break;
                case 3:
                  
                    break;
                case 4:
                  
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [self performSegueWithIdentifier:@"ruleDetail" sender:self];
}
@end
