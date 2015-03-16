//
//  SubmitViewController.h
//  Ring of Fire
//
//  Created by Sam Stone on 14/12/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitViewController : UITableViewController
- (IBAction)submit:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UITextField *two;
@property (strong, nonatomic) IBOutlet UITextField *three;
@property (strong, nonatomic) IBOutlet UITextField *four;
@property (strong, nonatomic) IBOutlet UITextField *five;
@property (strong, nonatomic) IBOutlet UITextField *six;
@property (strong, nonatomic) IBOutlet UITextField *seven;
@property (strong, nonatomic) IBOutlet UITextField *eight;
@property (strong, nonatomic) IBOutlet UITextField *nine;
@property (strong, nonatomic) IBOutlet UITextField *ten;
@property (strong, nonatomic) IBOutlet UITextField *jack;
@property (strong, nonatomic) IBOutlet UITextField *queen;
@property (strong, nonatomic) IBOutlet UITextField *king;
@property (strong, nonatomic) IBOutlet UITextField *ace;

@end
