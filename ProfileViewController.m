//
//  ProfileViewController.m
//  Ring of Fire
//
//  Created by Sam Stone on 11/03/2015.
//  Copyright (c) 2015 Olivier Gutknecht. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block NSString *facebookId;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
