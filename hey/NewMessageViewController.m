//
//  NewMessageViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 18.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "NewMessageViewController.h"
#import "MessagesViewController.h"

#import "Message.h"
#import "Vehicle.h"


@interface NewMessageViewController ()

@property (nonatomic, strong) Message *message;

@property (nonatomic, weak) IBOutlet UITextView *messageBodyTextView;
@property (nonatomic, weak) IBOutlet UITextField *licenseNumberTextField;

@end

@implementation NewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.message = [[Message alloc] init];
}

- (IBAction)done:(id)sender {
    self.message.body = self.messageBodyTextView.text;
    Vehicle *vehicle = [[Vehicle alloc] init];
    vehicle.licenseNumber = self.licenseNumberTextField.text;
    self.message.vehicle = vehicle;
    
    [self.messagesViewController addMessage:self.message];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
