//
//  NewMessageViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 01.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewMessageViewController.h"
#import "AddVehicleViewController.h"

#import "Message.h"
#import "Vehicle.h"

typedef enum : NSUInteger {
    TableViewCellLicenseNumber = 0,
    TableViewCellPhoto = 1,
    TableViewCellSituationType = 3,
} TableViewCell;

@interface NewMessageViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>

@property (nonatomic, strong) Message *message;

@property (weak, nonatomic) IBOutlet UILabel *emotionPlusLabel;
@property (weak, nonatomic) IBOutlet UILabel *emotionMinusLabel;
@property (weak, nonatomic) IBOutlet UISlider *emotionSlider;
@property (weak, nonatomic) IBOutlet UITextView *bodyMessageTextView;
@property (weak, nonatomic) IBOutlet UILabel *licenseNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *situationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation NewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.context performBlockAndWait:^{
        self.message = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.context];
    }];
    
    self.emotionMinusLabel.textColor = [UIColor blackColor];
    self.emotionPlusLabel.textColor = [UIColor blackColor];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if ([self.message.vehicle.licenseNumber length] == 0) {
        self.licenseNumberLabel.text = @"Введите";
    } else {
        self.licenseNumberLabel.text = self.message.vehicle.licenseNumber;
    }
}

- (void)presentImagePicker {
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePickerController.delegate = self;
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (IBAction)changeEmotion:(id)sender{
    self.message.emotions = (EmotionsType) [self.emotionSlider value];
//    
//    EmotionsTypeAnger,          // Гнев
//    EmotionsTypeDisagreement,   // Несогласие
//    EmotionsTypeNeutral,        // Нейтрально
//    EmotionsTypeAgreement,      // Согласие
//    EmotionsTypeEndorsement,    // Одобрение

    
    switch (self.message.emotions) {
        case EmotionsTypeAnger:
            self.emotionMinusLabel.textColor = [UIColor redColor];
            self.emotionPlusLabel.textColor = [UIColor grayColor];
            break;
        case EmotionsTypeDisagreement:
            self.emotionMinusLabel.textColor = [UIColor orangeColor];
            self.emotionPlusLabel.textColor = [UIColor grayColor];
            break;
        case EmotionsTypeNeutral:
            self.emotionMinusLabel.textColor = [UIColor blackColor];
            self.emotionPlusLabel.textColor = [UIColor blackColor];
            break;
        case EmotionsTypeAgreement:
            self.emotionMinusLabel.textColor = [UIColor grayColor];
            self.emotionPlusLabel.textColor = [UIColor yellowColor];
            break;
        case EmotionsTypeEndorsement:
            self.emotionMinusLabel.textColor = [UIColor grayColor];
            self.emotionPlusLabel.textColor = [UIColor greenColor];
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
// вызывается при нажатии статичных ячеек
    
    switch (indexPath.row) {
        case TableViewCellPhoto:
            [self presentImagePicker];
            break;
            
        case TableViewCellSituationType:
            [self presentSituationTypeActionSheet];
            break;
    }
}

- (NSString *)situationTypeString:(SituationType)situationType {
    switch (situationType) {
        case SituationTypeAccident:
            return @"Авария";
            
        case SituationTypeStyle:
            return @"Стиль вождения";
            
        case SituationTypeParking:
            return @"Парковка";
            
        case SituationTypeDating:
            return @"Знакомство";
            
        case SituationTypeQuestion:
            return @"Вопрос";
            
        case SituationTypeHelp:
            return @"Помощь";
            
        case SituationTypeBusiness:
            return @"Деловое предложение";
            
        case SituationTypeOther:
            return @"Прочее";
    }
}

- (void)presentSituationTypeActionSheet {
    NSString *title = @"Ситуация";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *regularAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeAccident]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeAccident;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:regularAction];
    
    UIAlertAction *styleAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeStyle]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeStyle;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:styleAction];
    
    UIAlertAction *parkingAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeParking]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeParking;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:parkingAction];
    
    UIAlertAction *datingAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeDating]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeDating;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:datingAction];
    
    UIAlertAction *questionAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeQuestion]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeQuestion;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:questionAction];
    
    UIAlertAction *helpAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeHelp]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeHelp;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:helpAction];
    
    UIAlertAction *businessAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeBusiness]
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                              self.message.situation = SituationTypeBusiness;
                                                              self.situationLabel.text = action.title;
                                                          }];
    [alertController addAction:businessAction];
    
   
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:[self situationTypeString:SituationTypeOther]
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            self.message.situation = SituationTypeOther;
                                                            self.situationLabel.text = action.title;
                                                        }];
    [alertController addAction:otherAction];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Отмена"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)done:(id)sender {
    [self.bodyMessageTextView resignFirstResponder];
    
    [self.context performBlockAndWait:^{
        if ([self.context hasChanges]) {
            NSError *error = nil;
            if (![self.context save:&error]) {
                NSLog(@"Error accured while searching user: %@", [error localizedDescription]);
            }
        }
    }];
    
    [self.context.parentContext save:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textViewdDidEndEditing:(UITextView *)textView {
   self.message.body = textView.text;
}


#pragma mark - Image Picker Controller Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *photo = info[UIImagePickerControllerOriginalImage];
    self.photoImageView.image = photo;

    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ModalAddVehicle"]) {
        [self.tableView setEditing:NO animated:YES];
        
        UINavigationController *navigationController = segue.destinationViewController;
        AddVehicleViewController *addVehicleViewController = [navigationController.viewControllers firstObject];

        NSManagedObjectContext *childContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        childContext.parentContext = self.context;
        addVehicleViewController.context = childContext;
    }
}


@end
