//
//  MyCollectionViewCell.h
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-13.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVPlayer.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MyCollectionViewCell : UICollectionViewCell<MPPlayableContentDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@property(nonatomic)NSURL *url;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UITextView *description;
-(void)setNotification;
@end
