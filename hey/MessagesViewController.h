//
//  MasterViewController.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OldMessage;

@interface MessagesViewController : UITableViewController

- (void)addNewMessage:(OldMessage *)message;

@end

