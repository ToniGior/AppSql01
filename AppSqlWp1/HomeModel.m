//
//  HomeModel.m
//  AppSqlWp1
//
//  Created by antonino giorgetti on 05/10/15.
//  Copyright (c) 2015 antonino giorgetti. All rights reserved.
//

#import "HomeModel.h"
#import "Indirizzo.h"


@interface HomeModel()

{
    NSMutableData * _downloadedData;
    
}


@end



@implementation HomeModel


-(void)downloadItems
{
   
    
    //NSLog(@"HomeModel.m  downloadItems: ");
    
    // download json file
     NSURL *jsonFileUrl =
   
     [NSURL URLWithString:@"http://ilmatematico.it/service.php" ];
    //[NSURL URLWithString:@"https://ilmatematico.it/service.php" ];
    
    
      NSLog(@"HomeModel.m jsonfileurl  %@",jsonFileUrl);
    
//  crea la richiesta
    
    NSURLRequest *urlRequest =
    [[NSURLRequest alloc ] initWithURL:jsonFileUrl];
     
     
     //  crea la connessione NSURLConnection
    
    [NSURLConnection connectionWithRequest:urlRequest delegate:self ];
    
    
    NSLog(@"HomeModel.m urlRequest:   %@  ",urlRequest);
    
}
 



//**************************************

/*

-(void)downloadItems
{
    
    
    //NSLog(@"HomeModel.m  downloadItems: ");
    
    // download json file
    NSURL *jsonFileUrl =
    [NSURL URLWithString:@"http://ilmatematico.it/service.php" ];
    
    NSLog(@"HomeModel.m jsonfileurl  %@",jsonFileUrl);
    
    //  crea la richiesta
    
    NSURLRequest *urlRequest =
    [[NSURLRequest alloc ] initWithURL:jsonFileUrl];
    
    
    //  crea la connessione NSURLConnection
    
    //[NSURLConnection connectionWithRequest:urlRequest delegate:self ];
     NSURLConnection * connection = [[NSURLConnection alloc]
     initWithRequest:urlRequest
     delegate:self startImmediately:NO];
 
    [connection scheduleInRunLoop:[NSRunLoop mainRunLoop]
    forMode:NSDefaultRunLoopMode];
    [connection start];
    NSLog(@"HomeModel.m urlRequest:  \r %@  ",urlRequest);
 
}

 */

//**************************************


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
     NSLog(@"HomeModel.m ERROR:   \n %@  ",error);
}


#pragma mark NSURLConnectionDataProtocol Methods



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    
     _downloadedData = [[NSMutableData alloc] init];
    
    NSLog(@"HomeModel.m didReceiveRespone NSURLConnectionDataProtocolLo %@ ",_downloadedData);
    
     //  [_downloadedData  setLength:0];
}



     
-(void) connection:(NSURLConnection *) connection
     
     didReceiveData:(NSData *)data

{
    
         //accoda i nuovi dati
    
         [_downloadedData  appendData:data];
    
    NSLog(@"HomeModel.m didReceiveData: downloadedData: \n %@",_downloadedData);
    
    
}


-(void) connectionDidFinishLoading:(NSURLConnection *)connection

{
    //crea un array per memorizzare indirizzi
    
    NSLog(@"HomeModel.m  didFinishLoading: \n %@ ",_downloadedData);
    
    
    NSMutableArray * _locations = [[NSMutableArray alloc] init];
     
  // parse il json
    
     NSError *error;
     
     NSArray *jsonArray = [NSJSONSerialization
        JSONObjectWithData:_downloadedData                                                          options:NSJSONReadingAllowFragments error:&error];
     
     //loop
    
for (int i=0; i<jsonArray.count; i++)
{
          
    NSDictionary *jsonElement = jsonArray[i];
   
     
// crea un nuovo oggetto Indirizzo (Location
     
     Indirizzo *newIndirizzo = [[Indirizzo alloc] init];
    
    //NSLog(@"This is my float: %f \n\nAnd here again: %.2f", aFloat, aFloat);
    
  
     newIndirizzo.name = jsonElement[@"Name"];
     newIndirizzo.address   = jsonElement[@"Address"];
     newIndirizzo.latitude   = jsonElement[@"Latitude"];
     newIndirizzo.longitude  = jsonElement[@"Longitude"];
    
      NSLog(@"HomeModel.m :  %@", newIndirizzo.name);
    
     [_locations addObject:newIndirizzo];
    
}
     
    //
    if (self.delegate)
     
     {
         
         [self.delegate itemsDownloaded:_locations];
         
        NSLog(@"HomeModel.m : dopo self.delegate @");
     }
     
}

@end
