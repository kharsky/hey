//
//  MasterViewController.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Message;

@interface MessagesViewController : UITableViewController

- (void)addMessage:(Message *)message;

@end

