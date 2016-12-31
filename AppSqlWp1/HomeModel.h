//
//  HomeModel.h
//  AppSqlWp1
//
//  Created by antonino giorgetti on 05/10/15.
//  Copyright (c) 2015 antonino giorgetti. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol HomeModelProtocol <NSObject>
-(void)itemsDownloaded:(NSArray *)items;
@end


@interface HomeModel : NSObject<NSURLConnectionDataDelegate>


@property (nonatomic, weak) id<HomeModelProtocol> delegate;

-(void)downloadItems;


@end
