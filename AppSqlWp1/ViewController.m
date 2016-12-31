//
//  ViewController.m
//  AppSqlWp1
//
//  Created by antonino giorgetti on 05/10/15.
//  Copyright (c) 2015 antonino giorgetti. All rights reserved.
//

#import "ViewController.h"
#import "Indirizzo.h"

@interface ViewController ()

{
      HomeModel * _homeModel;

      NSArray *_feedItems;
    //NSMutableData *_responseData;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    

    _feedItems  = [[NSArray alloc] init];
    
    //
    
    
    _homeModel = [[HomeModel alloc] init];
    
    //
    _homeModel.delegate = self;
    
    
    // call
    
    [_homeModel downloadItems];
    
    NSLog(@"ViewController.m viewDidLoad  \n  ");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"ViewController.m memory warning   \n");
    
}




- (void)itemsDownloaded:(NSArray *) items
{
    
    //
     
     _feedItems = items;
    
      NSLog(@"ViewController.m viewDidLoad itemsDownloaded  \n %@ ", items);
    
     [self.listTableView reloadData];
    
      NSLog(@"ViewController.m viewDidLoad  itemsDownloaded fine \n ");
    
    
    
    
}


  #pragma  mark  TABLE VIEW DELEGATE METHODS;

  - (NSInteger)tableView:(UITableView *) tableView
       numberOfRowsInSection:(NSInteger)section

 {
  
      NSLog(@"ViewController.m tableView0 \n @%u", (unsigned)_feedItems.count);
     
     // NSLog(@"ViewController.m tableView0 ");
     
     
      return  _feedItems.count;
     
     
 }


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    
    
    NSLog(@"ViewController.m tableView - indexPath \n @%u",(unsigned) indexPath.row);
    
    
    NSString *cellIdentifier = @"BasicCell";
    
    UITableViewCell * myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Indirizzo *item = _feedItems[indexPath.row];
    
    NSLog(@"ViewController.m tableView - address \n %@ ", item.address);
    
   
    myCell.textLabel.textAlignment = NSTextAlignmentLeft;
    
     NSLog(@"ViewController.m tableView - prima di return  \n");
    
    myCell.textLabel.text = item.address;
   
    
    return myCell;
  
    
}


 @end
