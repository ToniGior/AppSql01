//
//  ViewController.h
//  AppSqlWp1
//
//  Created by antonino giorgetti on 05/10/15.
//  Copyright (c) 2015 antonino giorgetti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol>


@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@end

