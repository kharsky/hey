//
//  MyVehiclesViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 26.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MyVehiclesViewController.h"
#import "AddVehicleViewController.h"

#import "DataManager.h"
#import "Vehicle.h"

@interface MyVehiclesViewController ()

@property (nonatomic, copy) NSArray *myVehicles;

@end

@implementation MyVehiclesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setEditing:YES animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
    DataManager *dataManager = [DataManager sharedManager];
    self.myVehicles = [dataManager myVehicles];
    
    [self.tableView reloadData];
}

- (void)addVehicle:(Vehicle *)vehicle {
    DataManager *dataManager = [DataManager sharedManager];
    [dataManager addMyVehicle:vehicle];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myVehicles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VehicleCell" forIndexPath:indexPath];

    Vehicle *vehicle = [self.myVehicles objectAtIndex:indexPath.row];
    cell.textLabel.text = vehicle.licenseNumber;
    
    return cell;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalAddVehicle"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        
        AddVehicleViewController *addVehicleViewController = [navigationController.viewControllers firstObject];
        
        addVehicleViewController.myVehiclesViewController = self;
    }
}

@end
