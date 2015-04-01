//
//  RuleSetViewController.m
//  Ring of Fire
//
//  Created by Sam Stone on 21/12/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "RuleSetViewController.h"

@interface RuleSetViewController ()

@end

@implementation RuleSetViewController
@synthesize ruleRating;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Custom initialization
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource=self;
    _tableView.delegate = self;
    self.colors = @[ [UIColor colorWithRed:0.11f green:0.38f blue:0.94f alpha:1.0f], [UIColor colorWithRed:1.0f green:0.22f blue:0.22f alpha:1.0f], [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f], [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f]];
    NSLog(@"%@", [self.rules objectForKey:@"two"]);
    _name.text = [NSString stringWithFormat:@"%@", [self.rules objectForKey:@"addedBy"]];
    _ruleTitle.text = [NSString stringWithFormat:@"%@", [self.rules objectForKey:@"title"]];
        
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIFont fontWithName:@"Avenir-Black" size:16.0f],UITextAttributeFont,
                                                          nil] forState:UIControlStateNormal];
      
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellText;
    if (indexPath.row == 0){
         cellText = [self.rules objectForKey:@"two"];
        
    }
    if (indexPath.row == 1){
        cellText = [self.rules objectForKey:@"three"];
    }
    if (indexPath.row == 2){
        cellText =[self.rules objectForKey:@"four"];
    }
    if (indexPath.row == 3){
        cellText =[self.rules objectForKey:@"five"];
    }
    if (indexPath.row == 4){
        cellText =[self.rules objectForKey:@"six"];
    }
    if (indexPath.row == 5){
        cellText = [self.rules objectForKey:@"seven"];
    }
    if (indexPath.row == 6){
        cellText = [self.rules objectForKey:@"eight"];
    }
    if (indexPath.row == 7){
         cellText = [self.rules objectForKey:@"nine"];
    }
    if (indexPath.row == 8){
        cellText =[self.rules objectForKey:@"ten"];
    }
    if (indexPath.row == 9){
        cellText =[self.rules objectForKey:@"jack"];
    }
    if (indexPath.row == 10){
        cellText =[self.rules objectForKey:@"queen"];
    }
    if (indexPath.row == 11){
        cellText = [self.rules objectForKey:@"king"];
    }
    if (indexPath.row == 12){
        cellText = [self.rules objectForKey:@"ace"];
    }
    

    
    UIFont *cellFont = [UIFont fontWithName:@"Avenir" size:14.0];
    CGSize constraintSize = CGSizeMake(self.tableView.frame.size.width, MAXFLOAT);
    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    return labelSize.height + 60;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 13;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
   
   
        
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
    

    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Black" size:18.0f];
     cell.detailTextLabel.font = [UIFont fontWithName:@"Avenir" size:14.0f];
    
    if (indexPath.row == 0){
    cell.textLabel.text = @"Two";
        cell.detailTextLabel.text = [self.rules objectForKey:@"two"];

    }
    if (indexPath.row == 1){
        cell.textLabel.text = @"Three";
         cell.detailTextLabel.text = [self.rules objectForKey:@"three"];
    }
    if (indexPath.row == 2){
        cell.textLabel.text = @"Four";
         cell.detailTextLabel.text = [self.rules objectForKey:@"four"];
    }
    if (indexPath.row == 3){
        cell.textLabel.text = @"Five";
         cell.detailTextLabel.text = [self.rules objectForKey:@"five"];
    }
    if (indexPath.row == 4){
        cell.textLabel.text = @"Six";
         cell.detailTextLabel.text = [self.rules objectForKey:@"six"];
    }
    if (indexPath.row == 5){
        cell.textLabel.text = @"Seven";
         cell.detailTextLabel.text = [self.rules objectForKey:@"seven"];
    }
    if (indexPath.row == 6){
        cell.textLabel.text = @"Eight";
         cell.detailTextLabel.text = [self.rules objectForKey:@"eight"];
    }
    if (indexPath.row == 7){
        cell.textLabel.text = @"Nine";
         cell.detailTextLabel.text = [self.rules objectForKey:@"nine"];
    }
    if (indexPath.row == 8){
        cell.textLabel.text = @"Ten";
         cell.detailTextLabel.text = [self.rules objectForKey:@"ten"];
    }
    if (indexPath.row == 9){
        cell.textLabel.text = @"Jack";
         cell.detailTextLabel.text = [self.rules objectForKey:@"jack"];
    }
    if (indexPath.row == 10){
        cell.textLabel.text = @"Queen";
         cell.detailTextLabel.text = [self.rules objectForKey:@"queen"];
    }
    if (indexPath.row == 11){
        cell.textLabel.text = @"King";
         cell.detailTextLabel.text = [self.rules objectForKey:@"king"];
    }
    if (indexPath.row == 12){
        cell.textLabel.text = @"Ace";
         cell.detailTextLabel.text = [self.rules objectForKey:@"ace"];
    }
 
    
 

 
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
