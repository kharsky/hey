//
//  AddVehicleViewController.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 22.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vehicle;
@protocol AddVehicleViewControllerDelegate;

@interface AddVehicleViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, weak) id<AddVehicleViewControllerDelegate> delegate;

@end

@protocol AddVehicleViewControllerDelegate <NSObject>

@optional
- (void)addVehicleViewController:(AddVehicleViewController *)controller willSaveVehicle:(Vehicle *)vehicle;
- (void)addVehicleViewController:(AddVehicleViewController *)controller didSaveVehicle:(Vehicle *)vehicle;
- (void)addVehicleViewControllerDidCancel:(AddVehicleViewController *)controller;

@end
