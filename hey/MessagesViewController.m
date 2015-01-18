//
//  MasterViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MessagesViewController.h"
#import "NewMessageViewController.h"

#import "Message.h"

@interface MessagesViewController ()

@property (nonatomic, copy) NSMutableArray *messages;

@end

@implementation MessagesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    Message *message1 = [[Message alloc] init];
    message1.body = @"Строка один";
    message1.timestamp = [NSDate date];
    
    Message *message2 = [[Message alloc] init];
    message2.body = @"Строка два";
    message2.timestamp = [NSDate date];
    
    Message *message3 = [[Message alloc] init];
    message3.body = @"Строка три";
    message3.timestamp = [NSDate date];
    
    self.messages = [[NSMutableArray alloc] init];
}

- (void)addMessage:(Message *)message {
    [self.messages addObject:message];

    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    Message *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = message.body;
    
    return cell;
}

#pragma mark - Navigation 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalNewMessage"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        
        NewMessageViewController *newMessageViewController = [navigationController.viewControllers firstObject];
        newMessageViewController.messagesViewController = self;
    
    }
}

@end
