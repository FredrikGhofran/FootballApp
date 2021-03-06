//
//  MainVC.m
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-08.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "MainVC.h"
#import "SpainViewController.h"
@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    NSString *identifier;
    
    switch (indexPath.row) {
        case 0:
            identifier = @"firstSegue";
            [SpainViewController setVideosUrl:@"http://fredrikghofran.com/football/getAllVideos.php"];
            [SpainViewController setCurrentTitle:@"VM 2014"];
            break;
        case 1:
            identifier = @"secondSegue";
            [SpainViewController setVideosUrl:@""];
            [SpainViewController setCurrentTitle:@"Test"];
            break;

            
    }
    return identifier;
}
-(void)configureLeftMenuButton:(UIButton *)button
{
    
    CGRect frame = button.frame;
    
    frame.origin = (CGPoint){0,0};
    frame.size = (CGSize){40,40};
    
    button.frame = frame;
    
    [button setImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
    
    
}
-(CGFloat)leftMenuWidth
{
    return 200;
}

-(BOOL)deepnessForLeftMenu
{
    return YES;
    
}


@end
