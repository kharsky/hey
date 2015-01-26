//
//  MyVehiclesViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 26.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MyVehiclesViewController.h"
#import "AddVehicleViewController.h"

#import "Vehicle.h"

@interface MyVehiclesViewController ()

@property (nonatomic, strong) NSMutableArray *myVehicles;

@end

@implementation MyVehiclesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myVehicles = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addVehicle:(Vehicle *)vehicle {
    [self.myVehicles addObject:vehicle];
    
    [self.tableView reloadData];
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


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalAddVehicle"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        
        AddVehicleViewController *addVehicleViewController = [navigationController.viewControllers firstObject];
        
        addVehicleViewController.myVehiclesViewController = self;
    }
}

@end
