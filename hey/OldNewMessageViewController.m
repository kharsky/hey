//
//  NewMessageViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 18.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "OldNewMessageViewController.h"
#import "MessagesViewController.h"

#import "OldMessage.h"
#import "OldVehicle.h"


@interface OldNewMessageViewController ()

@property (nonatomic, strong) OldMessage *message;

@property (nonatomic, weak) IBOutlet UITextView *messageBodyTextView;
@property (nonatomic, weak) IBOutlet UITextField *licenseNumberTextField;

@end

@implementation OldNewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.message = [[OldMessage alloc] init];
}

- (IBAction)done:(id)sender {
    self.message.body = self.messageBodyTextView.text;
    OldVehicle *vehicle = [[OldVehicle alloc] init];
    vehicle.licenseNumber = self.licenseNumberTextField.text;
    self.message.vehicle = vehicle;
    
   // [self.messagesViewController addMessage:self.message];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
