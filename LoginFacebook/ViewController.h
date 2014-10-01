//
//  ViewController.h
//  LoginFacebook
//
//  Created by Bruno on 10/1/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *outletStatus;
@property (weak, nonatomic) IBOutlet UILabel *outletName;
@property (weak, nonatomic) IBOutlet UILabel *outletEmail;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

@end

