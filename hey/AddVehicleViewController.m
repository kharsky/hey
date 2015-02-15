//
//  AddVehicleViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 22.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "AddVehicleViewController.h"

#import "LicenseNumberValidator.h"
#import "Vehicle.h"

typedef enum : NSUInteger {
    TableViewCellLicenseNumber,
    TableViewCellLicenseNumberType,
    TableViewCellVehicleType,
} TableViewCell;

@interface AddVehicleViewController () <UITextFieldDelegate>

@property (nonatomic, strong) Vehicle *vehicle;

@property (weak, nonatomic) IBOutlet UITextField *licenseNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *licenseNumberTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *vehicleType;

@end

@implementation AddVehicleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.context performBlockAndWait:^{
        self.vehicle = [NSEntityDescription insertNewObjectForEntityForName:@"Vehicle" inManagedObjectContext:self.context];
    }];
    
    [self.licenseNumberTextField becomeFirstResponder];
}

- (NSString *)licenseNumberTypeString:(LicenseNumberType)licenseNumberType {
    switch (licenseNumberType) {
        case LicenseNumberTypeRegular:
            return @"Обычный";
            
        case LicenseNumberTypePublic:
            return @"Общественый";
            
        case LicenseNumberTypePolice:
            return @"Полиция";
            
        case LicenseNumberTypeOther:
            return @"Прочее";
    }
}

- (NSString *)vehicleTypeString:(VehicleType)vehicleType {
    switch (vehicleType) {
        case VehicleTypePassenger:
            return @"Легковой";
            
        case VehicleTypeTruck:
            return @"Грузовой";
            
        case VehicleTypeSUV:
            return @"Внедорожник";
            
        case VehicleTypeOther:
            return @"Прочее";
    }
}

- (void)presentLicenseNumberTypeActionSheet {
    NSString *title = @"Тип гос.номера";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    
    UIAlertAction *regularAction = [UIAlertAction actionWithTitle:[self licenseNumberTypeString:LicenseNumberTypeRegular]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypeRegular;
                                                              self.licenseNumberTypeLabel.text = action.title;
                                                          }];
    [alertController addAction:regularAction];
    
    UIAlertAction *publicAction = [UIAlertAction actionWithTitle:[self licenseNumberTypeString:LicenseNumberTypePublic]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypePublic;
                                                              self.licenseNumberTypeLabel.text = action.title;
                                                          }];
    [alertController addAction:publicAction];
    
    UIAlertAction *policeAction = [UIAlertAction actionWithTitle:[self licenseNumberTypeString:LicenseNumberTypePolice]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypePolice;
                                                              self.licenseNumberTypeLabel.text = action.title;
                                                          }];
    [alertController addAction:policeAction];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:[self licenseNumberTypeString:LicenseNumberTypeOther]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.licenseNumberType = LicenseNumberTypeOther;
                                                              self.licenseNumberTypeLabel.text = action.title;
                                                          }];
    [alertController addAction:otherAction];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Отмена"
                                                          style:UIAlertActionStyleCancel
                                                        handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)presentVehicleTypeActionSheet {
    NSString *title = @"Тип автомобиля";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *passengerAction = [UIAlertAction actionWithTitle:[self vehicleTypeString:VehicleTypePassenger]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.vehicle.vehicleType = VehicleTypePassenger;
                                                              self.vehicleType.text = action.title;
                                                          }];
    [alertController addAction:passengerAction];
    
    UIAlertAction *truckAction = [UIAlertAction actionWithTitle:[self vehicleTypeString:VehicleTypeTruck ]
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
                                                             self.vehicle.vehicleType = VehicleTypeTruck;
                                                             self.vehicleType.text = action.title;                                                   }];
    [alertController addAction:truckAction];
    
    UIAlertAction *suvAction = [UIAlertAction actionWithTitle:[self vehicleTypeString:VehicleTypeSUV]
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
                                                             self.vehicle.vehicleType = VehicleTypeSUV;
                                                             self.vehicleType.text = action.title;
                                                         }];
    [alertController addAction:suvAction];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:[self vehicleTypeString:VehicleTypeOther]
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            self.vehicle.vehicleType = VehicleTypeOther;
                                                            self.vehicleType.text = action.title;
                                                        }];
    [alertController addAction:otherAction];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Отмена"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case TableViewCellLicenseNumber:
            [self.licenseNumberTextField becomeFirstResponder];
            break;
            
        case TableViewCellLicenseNumberType:
            [self presentLicenseNumberTypeActionSheet];
            break;
            
        case TableViewCellVehicleType:
            [self presentVehicleTypeActionSheet];
            break;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (![LicenseNumberValidator isLicenseNumberValid:textField.text]) {
        // TODO:Предупредить пользователя о неверном номере авто
        return;
    }
    self.vehicle.licenseNumber = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    return YES;
}

- (IBAction)cancel:(id)sender {
    if ([self.delegate respondsToSelector:@selector(addVehicleViewControllerDidCancel:)]) {
        [self.delegate addVehicleViewControllerDidCancel:self];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender {
    [self.licenseNumberTextField resignFirstResponder];
    
    // 1. Вызвать и спросить у делегата что делать с автомобилем
    if ([self.delegate respondsToSelector:@selector(addVehicleViewController:willSaveVehicle:)]) {
        [self.delegate addVehicleViewController:self willSaveVehicle:self.vehicle];
    }

    // 2. Сохранить автомобиль
    [self.context performBlockAndWait:^{
        if ([self.context hasChanges]) {
            NSError *error = nil;
            if (![self.context save:&error]) {
                NSLog(@"Error accured while saving vehicle: %@", [error localizedDescription]);
            }
        }
    }];

    if ([self.delegate respondsToSelector:@selector(addVehicleViewController:didSaveVehicle:)]) {
        [self.delegate addVehicleViewController:self didSaveVehicle:self.vehicle];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
