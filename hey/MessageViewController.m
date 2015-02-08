//
//  MessageViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 19.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MessageViewController.h"
#import "MessagesViewController.h"

#import "OldMessage.h"
#import "OldVehicle.h"

@interface MessageViewController ()

@property (weak, nonatomic) IBOutlet UILabel *licenseNumderLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageBodyTextView;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.licenseNumderLabel.text = self.message.vehicle.licenseNumber;
    self.messageBodyTextView.text = self.message.body;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
