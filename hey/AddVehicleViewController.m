//
//  AddVehicleViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 22.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "AddVehicleViewController.h"

#import "Vehicle.h"

typedef enum : NSUInteger {
    TableViewCellLicenseNumberType = 1,
    TableViewCellVehicleType,
} TableViewCell;

@interface AddVehicleViewController ()

@property (nonatomic, strong) Vehicle *vehicle;

@end

@implementation AddVehicleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vehicle = [[Vehicle alloc] init];
}

- (void)presentLicenseNumberTypeActionSheet {
    NSString *title = @"Тип гос.номера";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    
    UIAlertAction *regularAction = [UIAlertAction actionWithTitle:@"Обычный"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypeRegular;
                                                          }];
    [alertController addAction:regularAction];
    
    UIAlertAction *publicAction = [UIAlertAction actionWithTitle:@"Общественый"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypePublic;
                                                          }];
    [alertController addAction:publicAction];
    
    UIAlertAction *policeAction = [UIAlertAction actionWithTitle:@"Полиция"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypePolice;
                                                          }];
    [alertController addAction:policeAction];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"Прочее"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypeOther;
                                                          }];
    [alertController addAction:otherAction];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Отмена"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)presentVehicleTypeActionSheet {

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case TableViewCellLicenseNumberType:
            [self presentLicenseNumberTypeActionSheet];
            break;
            
        case TableViewCellVehicleType:
            [self presentVehicleTypeActionSheet];
            break;
    }
}

@end
