//
//  ReadMessageViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 07.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "ReadMessageViewController.h"

@interface ReadMessageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *EmotionsTypeLabel;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIImageView *SituationTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *SituationTypeLabel;

@end

@implementation ReadMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


@end
