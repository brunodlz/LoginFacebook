//
//  ViewController.m
//  LoginFacebook
//
//  Created by Bruno on 10/1/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController ()

-(void)toggleHiddenState:(BOOL)shouldHide;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self toggleHiddenState:YES];
    self.outletName.text = @"";
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
    self.loginButton.delegate = self;
}

-(void)toggleHiddenState:(BOOL)shouldHide{
    self.outletName.hidden = shouldHide;
    self.outletEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.outletStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    self.profilePicture.profileID = user.id;
    self.outletName.text = user.name;
    self.outletEmail.text = [user objectForKey:@"email"];
    
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.outletStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}

@end
