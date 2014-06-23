//
//  SpainTableViewController.m
//  FootballApp
//
//  Created by Fredrik Ghofran on 2014-06-08.
//  Copyright (c) 2014 FootballApp. All rights reserved.
//

#import "SpainTableViewController.h"
#import "VideoTableViewCell.h"
@interface SpainTableViewController ()
@property(nonatomic)NSArray *titles;
@property(nonatomic)NSArray *videos;

@end

@implementation SpainTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titles = @[@"Real Madrid - Atletico Madrid"];
    self.videos =@[@"99M68P0xMAA"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell reloadInputViews];
    cell.titleText.text = self.titles[indexPath.row];
//    [cell.webbView loadRequest:[self makeVieo:self.videos[indexPath.row]]];
    
    NSString *html = [NSString stringWithFormat:@"<object><param name=\"movie\" value=\"http://www.youtube.com/v/%@\"></param><embed src=\"http://www.youtube.com/v/%@\" type=\"application/x-shockwave-flash\"></embed></object>",self.videos[indexPath.row], self.videos[indexPath.row]];
    
    [cell.webbView loadHTMLString:html baseURL:nil];
    
    // Configure the cell...
    
    return cell;
}
-(NSURLRequest *)makeVieo:(NSString *)vieoText
{
    
    NSURL *url =[NSURL URLWithString:vieoText];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    return request;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
