//
//  MasterViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MessagesViewController.h"
#import "OldNewMessageViewController.h"
#import "MessageViewController.h"

#import "OldMessage.h"
#import "OldVehicle.h"

typedef enum : NSUInteger {
    MessagesViewControllerModeAll,
    MessagesViewControllerModeMy
} MessagesViewControllerMode;

@interface MessagesViewController ()

@property (nonatomic, strong) OldVehicle *myVehicle;

@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, strong) NSArray *myMessages;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentetControl;

@end

@implementation MessagesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myVehicle = [[OldVehicle alloc] init];
    self.myVehicle.licenseNumber = @"A111AA";
    self.myVehicle.licenseNumberType = LicenseNumberTypeRegular;
    self.myVehicle.vehicleType = VehicleTypePassenger;
    
    OldMessage *message1 = [[OldMessage alloc] init];
    message1.body = @"Строка один";
    message1.timestamp = [NSDate date];
    
    OldMessage *message2 = [[OldMessage alloc] init];
    message2.body = @"Строка два";
    message2.timestamp = [NSDate date];
    
    OldMessage *message3 = [[OldMessage alloc] init];
    message3.body = @"Строка три";
    message3.timestamp = [NSDate date];
    
    self.messages = [[NSMutableArray alloc] initWithObjects:message1, message2, message3, nil];
}

- (void)addNewMessage:(OldMessage *)message {
    [self.messages addObject:message];

    if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeMy) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"vehicle.licenseNumber == %@", self.myVehicle.licenseNumber];
        self.myMessages = [self.messages filteredArrayUsingPredicate:predicate];
    }
    
    [self.tableView reloadData];
}

- (IBAction)switchMode:(id)sender {
    if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeMy) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"vehicle.licenseNumber == %@", self.myVehicle.licenseNumber];
        self.myMessages = [self.messages filteredArrayUsingPredicate:predicate];
    }
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeMy) {
        return [self.myMessages count];
    }
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = nil;
 
    if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeAll) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"AllMessageCell" forIndexPath:indexPath];
        OldMessage *message = [self.messages objectAtIndex:indexPath.row];
        cell.textLabel.text = message.body;
        cell.detailTextLabel.text = message.vehicle.licenseNumber;
        cell.imageView.image = message.photo;
    } else if (self.segmentetControl.selectedSegmentIndex == MessagesViewControllerModeMy) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"MyMessageCell" forIndexPath:indexPath];
        OldMessage *message = [self.myMessages objectAtIndex:indexPath.row];
        cell.textLabel.text = message.body;
        cell.imageView.image = message.photo;
    }

    return cell;
}

#pragma mark - Navigation 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalNewMessage"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        
        OldNewMessageViewController *newMessageViewController = [navigationController.viewControllers firstObject];
        newMessageViewController.messagesViewController = self;
    }
    
    if ([segue.identifier isEqualToString:@"PushMessage"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        OldMessage *message = self.messages[indexPath.row];
        
        MessageViewController *messageViewController = segue.destinationViewController;
        messageViewController.message = message;
    }
}


@end
