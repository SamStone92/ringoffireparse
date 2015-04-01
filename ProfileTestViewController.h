//
//  ProfileTestViewController.h
//  Ring of Fire
//
//  Created by Sam Stone on 01/04/2015.
//  Copyright (c) 2015 Olivier Gutknecht. All rights reserved.
//

#import <ParseUI/ParseUI.h>
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <FacebookSDK/FacebookSDK.h>
@interface ProfileTestViewController : PFQueryTableViewController
@property (weak, nonatomic) NSString  *facebookId;
@end
