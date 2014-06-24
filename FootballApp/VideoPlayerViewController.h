//
//  VideoPlayerViewController.h
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-23.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVPlayer.h>
#import <MediaPlayer/MediaPlayer.h>
@interface VideoPlayerViewController : ViewController
@property(nonatomic)NSURL *url;
@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property(nonatomic)NSString *description;

@end
