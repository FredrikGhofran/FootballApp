//
//  VideoPlayerViewController.m
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-23.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import <AVFoundation/AVPlayer.h>
#import <MediaPlayer/MediaPlayer.h>
@interface VideoPlayerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;

@end

@implementation VideoPlayerViewController

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
    
    self.descriptionLabel.text = self.description;
    self.descriptionLabel.editable = NO;
    
    self.moviePlayer =[[MPMoviePlayerController alloc] initWithContentURL:self.url];
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer.view setFrame: self
     .myView.bounds];  // player's frame must match parent's
    [self.myView addSubview:self.moviePlayer.view];
    
    [self.moviePlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
