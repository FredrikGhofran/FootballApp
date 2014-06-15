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
@property(nonatomic)NSArray *titles;
@property(nonatomic)NSArray *videos;
@property(nonatomic)NSArray *descriptions;
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
    self.titles = @[@"Uruguay - Costa Rica",@"Chile - Australien",@"Spanien - Holland",@"Mexico - Kamerun",@"Brasilien - Kroatien"];
    self.videos =@[@"l5VPRJ27Z74",@"Gv6sEfNBnSk",@"RKpFqOTIjW8",@"G2tKqDp8RSo",@"3O9NPBYxd-Q"];
    self.descriptions = @[@"Costa Rica vinner och vänder ett 1-0 underläge till 1-3. Stor skräll från Costa Rica",@"Chile vinner säkert över Australien med 3-1",@"Holland vinner förvånansvärt stort över de regerande världsmästarna Spanien med 5-1, och kunde även gjort ett par till om de hade varit vassare i sina lägen.",@"Mexico vinner matchen enkelt med 1-0 även fast de får två mål bortdömda.",@"Brasilien vinner matchen med 3-1 efter två tveksamma beslut av dommaren. Kroatioen fick en tveksam straff dömd mot sig och ett bortdömt mål."];
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
    
    return self.videos.count;
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
