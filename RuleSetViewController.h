//
//  RuleSetViewController.h
//  Ring of Fire
//
//  Created by Sam Stone on 21/12/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDStarRating.h"
#import <Parse/Parse.h>

@interface RuleSetViewController : UIViewController <EDStarRatingProtocol, UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *rateStarsText;

@property (strong, nonatomic) IBOutlet UILabel *ruleTitle;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet EDStarRating *ruleRating;
@property (strong,nonatomic) NSArray *colors;
@property (strong,nonatomic) NSString* ruleTwo;
@property (strong,nonatomic) NSString* ruleThree;
@property (strong,nonatomic) NSString* ruleFour;
@property (strong,nonatomic) NSString* ruleFive;
@property (strong,nonatomic) NSString* ruleSix;
@property (strong,nonatomic) NSString* ruleSeven;
@property (strong,nonatomic) NSString* ruleEight;
@property (strong,nonatomic) NSString* ruleNine;
@property (strong,nonatomic) NSString* ruleTen;
@property (strong,nonatomic) NSString* ruleJack;
@property (strong,nonatomic) NSString* ruleQueen;
@property (strong,nonatomic) NSString* ruleKing;
@property (strong,nonatomic) NSString* ruleAce;

@property (strong, nonatomic) PFObject *rules;
@end
