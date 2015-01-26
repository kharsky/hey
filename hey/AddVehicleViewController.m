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

@end

@implementation AddVehicleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vehicle = [[Vehicle alloc] init];
    
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
}


- (IBAction)done:(id)sender {
    [self.licenseNumberTextField resignFirstResponder];
    [self.myVehiclesViewController addVehicle:self.vehicle];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
