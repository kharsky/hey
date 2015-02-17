//
//  MasterViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MessagesViewController.h"
#import "MessageViewController.h"
#import "LoginViewController.h"
#import "NewMessageViewController.h"

#import "Message.h"
#import "Vehicle.h"

typedef enum : NSUInteger {
    MessagesViewControllerModeAll,
    MessagesViewControllerModeMy
} MessagesViewControllerMode;

@interface MessagesViewController ()

@property (nonatomic, strong) NSArray *messages;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentetControl;

@end

@implementation MessagesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if(![self isUserExistWithUsername:@"user1" password:@"user1"]) {
        [self performSegueWithIdentifier:@"ModalLogin" sender:nil];
    }
    
    self.messages = [self allMessages];
}


- (IBAction)switchMode:(id)sender {
//    if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeMy) {
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"vehicle.licenseNumber == %@", self.myVehicle.licenseNumber];
//        self.myMessages = [self.messages filteredArrayUsingPredicate:predicate];
//    }
//    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
//    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = nil;
 
    if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeAll) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"AllMessageCell" forIndexPath:indexPath];
        Message *message = [self.messages objectAtIndex:indexPath.row];
        cell.textLabel.text = message.body;
        cell.detailTextLabel.text = message.vehicle.licenseNumber;
        cell.imageView.image = [UIImage imageWithData:message.photo];
    } else if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeMy) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"MyMessageCell" forIndexPath:indexPath];
        Message *message = [self.messages objectAtIndex:indexPath.row];
        cell.textLabel.text = message.body;
        cell.imageView.image = [UIImage imageWithData:message.photo];
    }

    return cell;
}

#pragma mark - Navigation 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalLogin"]) {
        LoginViewController *loginViewController = segue.destinationViewController;
        
        loginViewController.context = self.context;
    }
    
    if ([segue.identifier isEqualToString:@"PushNewMessage"]) {
        NewMessageViewController *newMessageViewController = segue.destinationViewController;
        
        NSManagedObjectContext *childContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        childContext.parentContext = self.context;
        newMessageViewController.context = childContext;
    }
    
    if ([segue.identifier isEqualToString:@"PushMessage"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        OldMessage *message = self.messages[indexPath.row];
        
        MessageViewController *messageViewController = segue.destinationViewController;
        messageViewController.message = message;
    }
}

#pragma mark - Working with Core Data

- (BOOL)isUserExistWithUsername:(NSString *)username password:(NSString *)password {
    
    __block BOOL isUserExist = NO;
    
    [self.context performBlockAndWait:^{
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username LIKE[c] %@ AND password LIKE[c] %@", username, password];
        [request setPredicate:predicate];
        
        NSError *error = nil;
        NSUInteger count = [self.context countForFetchRequest:request error:&error];
        if (count == NSNotFound) {
            NSLog(@"Error occurred while searching user: %@", [error localizedDescription]);
        }
        
        if (count > 0) {
            isUserExist = YES;
        }
    }];
    
    return isUserExist;
}

- (NSArray *)allMessages {
    
    __block NSArray *messages = nil;
    
    [self.context performBlockAndWait:^{
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Message"];
        
        NSError *error = nil;
        messages = [self.context executeFetchRequest:request error:&error];
        if (messages == nil) {
            NSLog(@"Error occurred while searching user: %@", [error localizedDescription]);
        }
    }];
    
    return messages;
}

@end
