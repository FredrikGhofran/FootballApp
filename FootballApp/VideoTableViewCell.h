//
//  VideoTableViewCell.h
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-08.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIWebView *webbView;
@property (weak, nonatomic) IBOutlet UILabel *titleText;

@end
