//
//  ProfileViewController.h
//  Ring of Fire
//
//  Created by Sam Stone on 11/03/2015.
//  Copyright (c) 2015 Olivier Gutknecht. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *userName;

@end
