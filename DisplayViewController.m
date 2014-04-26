//
//  DisplayViewController.m
//  SampleMonsoonProject
//
//  Created by Siddharth Sukumar on 4/24/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "DisplayViewController.h"
#import "CustomControl.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

  //  [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];

	UIBarButtonItem *calendarBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MON_calendarIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:nil];


    UIBarButtonItem *compassBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MON_compassIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:nil];

    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MON_searchIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:nil];

    UIBarButtonItem *menuBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MON_menuIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:nil];




    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:searchBarButtonItem,calendarBarButtonItem, compassBarButtonItem, nil];
    self.navigationItem.rightBarButtonItem = menuBarButtonItem;

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar_middlePart@2x.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent= NO;

    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];

    // creating the controls

    CustomControl *control1 = [[CustomControl alloc]initWithFrame:CGRectMake(20, 27, 136, 143) andArcNames:@[@"one of a kind", @"small batch", @"large batch", @"mass market"]];
    CustomControl *control2 = [[CustomControl alloc]initWithFrame:CGRectMake(166, 27, 136, 143) andArcNames:@[@"savory", @"sweet", @"umami"]];
    CustomControl *control3 = [[CustomControl alloc]initWithFrame:CGRectMake(20, 175, 136, 143) andArcNames:@[@"spicy", @"mild"]];
    CustomControl *control4 = [[CustomControl alloc]initWithFrame:CGRectMake(166, 175, 136, 143) andArcNames:@[@"crunchy", @"mushy", @"smooth"]];
    CustomControl *control5 = [[CustomControl alloc]initWithFrame:CGRectMake(20, 323, 136, 143) andArcNames:@[@"a little", @"a lot"]];
    CustomControl *control6 = [[CustomControl alloc]initWithFrame:CGRectMake(166, 323, 136, 143) andArcNames:@[@"breakfast", @"brunch", @"lunch", @"snack", @"dinner"]];

     control1.backgroundColor = [UIColor clearColor];
     control2.backgroundColor = [UIColor clearColor];
     control3.backgroundColor = [UIColor clearColor];
     control4.backgroundColor = [UIColor clearColor];
     control5.backgroundColor = [UIColor clearColor];
     control6.backgroundColor = [UIColor clearColor];


     [self.view addSubview:control1];
     [self.view addSubview:control2];
     [self.view addSubview:control3];
     [self.view addSubview:control4];
     [self.view addSubview:control5];
     [self.view addSubview:control6];



}







@end
