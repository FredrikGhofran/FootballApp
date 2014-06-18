//
//  MyCollectionViewCell.m
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-13.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Register for the playback finished notification
    }
    return self;
}
-(void)setNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"Registering listener: %@", self.titleLabel.text);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myMovieFinishedCallback)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification// notification the observer should listen to
                                               object:self.moviePlayer]; // the object that is passed to the method
}

-(void)dealloc {
    NSLog(@"Unregistering listener: %@", self.titleLabel.text);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
 */
-(void)myMovieFinishedCallback
{
    
    if(self.moviePlayer.playbackState == MPMoviePlaybackStatePlaying)
    {
        NSLog(@"Play %@",self.titleLabel.text);
        [self.playButton setTitle:@"" forState:UIControlStateNormal];
    }else{
        NSLog(@"Stop %@",self.titleLabel.text);

        [self.playButton setTitle:@"▶" forState:UIControlStateNormal];

    }

}
- (IBAction)startPlayer:(id)sender {
    if(!self.moviePlayer || !self.url){
        
        MPMoviePlayerController *player =[[MPMoviePlayerController alloc] initWithContentURL:self.url];
        self.moviePlayer = player;
        
        [self.moviePlayer prepareToPlay];
        [self.moviePlayer.view setFrame: self
         .myView.bounds];  // player's frame must match parent's
        [self.myView addSubview:self.moviePlayer.view];
        
    }else{
        if(self.moviePlayer.playbackState == MPMoviePlaybackStatePlaying)
        {
            
            [self.moviePlayer pause];
            
            self.playButton.titleLabel.text =@"";

        }else{

            [self.moviePlayer play];
            
            self.playButton.titleLabel.text =@"▶";

        }
    
    }
    
    [self.myView addSubview:self.playButton];
}

@end
