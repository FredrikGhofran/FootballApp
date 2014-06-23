//
//  MoviePlayerListener.h
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-19.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVPlayer.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MoviePlayerListener : NSObject<MPPlayableContentDelegate>
-(void)playerChange;
@end
