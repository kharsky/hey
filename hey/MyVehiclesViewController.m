//
//  MyVehiclesViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 26.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "MyVehiclesViewController.h"

#import "DataManager.h"
#import "OldVehicle.h"

@interface MyVehiclesViewController ()

@property (nonatomic, strong) NSMutableArray *myVehicles;

@end

@implementation MyVehiclesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataManager *dataManager = [DataManager sharedManager];
    self.myVehicles = [[dataManager myVehicles] mutableCopy];
}

- (void)addVehicle:(OldVehicle *)vehicle {
    DataManager *dataManager = [DataManager sharedManager];
    [dataManager addMyVehicle:vehicle];
    
    [self.myVehicles addObject:vehicle];
}

- (void)removeVehicle:(OldVehicle *)vehicle {
    DataManager *dataManager = [DataManager sharedManager];
    [dataManager removeMyVehicle:vehicle];
    
    [self.myVehicles removeObject:vehicle];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myVehicles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VehicleCell" forIndexPath:indexPath];

    OldVehicle *vehicle = [self.myVehicles objectAtIndex:indexPath.row];
    cell.textLabel.text = vehicle.licenseNumber;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    // метод вызывается при удалении данных из таблицы
    OldVehicle *vehicle = self.myVehicles[indexPath.row];
    [self removeVehicle:vehicle];
    
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalAddVehicle"]) {
        [self.tableView setEditing:NO animated:YES];
        
        UINavigationController *navigationController = segue.destinationViewController;
        AddVehicleViewController *addVehicleViewController = [navigationController.viewControllers firstObject];
    }
}


@end
