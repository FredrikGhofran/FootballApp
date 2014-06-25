//
//  SpainViewController.m
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-13.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "SpainViewController.h"
#import "MyCollectionViewCell.h"
#import <AVFoundation/AVPlayer.h>
#import <MediaPlayer/MediaPlayer.h>
#import "VideoPlayerViewController.h"
@interface SpainViewController ()
@property(nonatomic)NSMutableArray *titles;
@property(nonatomic)NSMutableArray *videos;
@property(nonatomic)NSMutableArray *images;
@property(nonatomic)NSMutableArray *descriptions;
@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SpainViewController
////////////////////////////////////
static  NSString* _videosUrl;
static  NSString* _currentTitle;
+ (NSString *)videosUrl
{
    if(!_videosUrl){
        NSLog(@"sätter ny");
        _videosUrl = @"http://fredrikghofran.com/football/getAllVideos.php";
    }
    return _videosUrl;
}

+ (void) setVideosUrl:(NSString *)videosUrl{
    _videosUrl = videosUrl;
}

+ (NSString *)currentTitle
{
    if(!_currentTitle){
        NSLog(@"sätter ny");
        _currentTitle = @"Latest upload";
        
    }
    return _currentTitle;
}

+ (void) setCurrentTitle:(NSString *)currentTitle{
    _currentTitle = currentTitle;
}
///////////////////////////////
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
    self.title =[SpainViewController currentTitle];
    [self.spinner startAnimating];
    self.titles = [[NSMutableArray alloc]init];
    self.videos = [[NSMutableArray alloc]init];
    self.images = [[NSMutableArray alloc]init];
    self.descriptions = [[NSMutableArray alloc]init];
    NSString *urlString = [SpainViewController videosUrl];
    
    NSLog(@"URL = %@",urlString);
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *parseError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
        for(int i = 0;i<jsonArray.count;i++)
        {
          
            NSDictionary *dic = jsonArray[i];
        
            [self.videos addObject:dic[@"videoText"]];
            [self.titles addObject:dic[@"title"]];
            [self.images addObject:dic[@"image"]];
    
            [self.descriptions addObject:dic[@"description"]];
            dispatch_async(dispatch_get_main_queue(),^{
                [self.collectionView reloadData];
                if (self.videos.count>20) {
                    [self.spinner stopAnimating];
                    self.spinner.hidesWhenStopped = YES;
                }
            });
        
        }
        dispatch_async(dispatch_get_main_queue(),^{
            [self.spinner stopAnimating];
            self.spinner.hidesWhenStopped = YES;
        });
  
    }];
    [task resume];
 
//    self.titles = @[@"Uruguay - Costa Rica",@"Chile - Australien",@"Spanien - Holland",@"Mexico - Kamerun",@"Brasilien - Kroatien"];
//    self.videos =@[@"qNoPy7CxvZc",@"Gv6sEfNBnSk",@"yXTFG97E4yY",@"G2tKqDp8RSo",@"dA2CuJUq8-Q"];
//    self.descriptions = @[@"Costa Rica vinner och vänder ett 1-0 underläge till 1-3. Stor skräll från Costa Rica",@"Chile vinner säkert över Australien med 3-1",@"Holland vinner förvånansvärt stort över de regerande världsmästarna Spanien med 5-1, och kunde även gjort ett par till om de hade varit vassare i sina lägen.",@"Mexico vinner matchen enkelt med 1-0 även fast de får två mål bortdömda.",@"Brasilien vinner matchen med 3-1 efter två tveksamma beslut av dommaren. Kroatioen fick en tveksam straff dömd mot sig och ett bortdömt mål."];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.videos) {
         return self.videos.count;
    }else{
        return 0;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.titleLabel.text = self.titles[indexPath.row];
    cell.titleLabel.editable = NO;
    cell.titleLabel.scrollEnabled = NO;
    
    cell.url =[NSURL URLWithString:self.videos[indexPath.row]];
    cell.description = self.descriptions[indexPath.row];
    if(!cell.imageLabel.image){
    NSData *data = [NSData dataWithContentsOfURL : [NSURL URLWithString:self.images[indexPath.row]]];

    UIImage *image = [UIImage imageWithData: data];
        
    [cell.imageLabel setImage:image];
    }

    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    VideoPlayerViewController *videoPlayerViewController = [segue destinationViewController];
    MyCollectionViewCell *cell = sender;
    videoPlayerViewController.description = cell.description;
    videoPlayerViewController.url = cell.url;
    
    
}

@end
