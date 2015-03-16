//
//  LoginViewController.h
//  Ring of Fire
//
//  Created by Sam Stone on 13/12/2014.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController


@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)loginButtonTouchHandler:(id)sender;
@end
