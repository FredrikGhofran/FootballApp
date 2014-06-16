//
//  SpainViewController.m
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-13.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "SpainViewController.h"
#import "MyCollectionViewCell.h"

@interface SpainViewController ()
@property(nonatomic)NSMutableArray *titles;
@property(nonatomic)NSMutableArray *videos;
@property(nonatomic)NSMutableArray *descriptions;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SpainViewController

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
    self.titles = [[NSMutableArray alloc]init];
    self.videos = [[NSMutableArray alloc]init];
    self.descriptions = [[NSMutableArray alloc]init];
    NSString *urlString = @"http://fredrikghofran.com/football/getAllVideos.php";
    
    
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *parseError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
        for(int i = 0;i<jsonArray.count;i++)
        {
        
            NSDictionary *dic = jsonArray[i];
            NSLog(@"1");
            NSLog(@"DIC = %@",dic);
            [self.videos addObject:dic[@"videoText"]];
            NSLog(@"2");
            [self.titles addObject:dic[@"title"]];
            NSLog(@"3");
            [self.descriptions addObject:dic[@"description"]];
            NSLog(@"4");
            NSLog(@"DESCTIPTION = %@",self.descriptions[i]);
            NSLog(@"5");
            dispatch_async(dispatch_get_main_queue(),^{
                [self.collectionView reloadData];
                NSLog(@"6");
            });
        
        }
  
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
    
    // Prepare for animation
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    

    
        cell.titleLabel.text =self.titles[indexPath.row];

        

        NSString *html = [NSString stringWithFormat:@"<object><param name=\"movie\" value=\"http://www.youtube.com/v/%@\"></param><embed src=\"http://www.youtube.com/v/%@\" type=\"application/x-shockwave-flash\"></embed></object>",self.videos[indexPath.row], self.videos[indexPath.row]];
        
        
        [cell.webView loadHTMLString:html baseURL:nil];
    
    
        cell.description.text = self.descriptions[indexPath.row];
        cell.description.editable = NO;
    
  
    //[cell.description setUserInteractionEnabled:NO];
    return cell;
}
- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

@end
