//
//  AddVehicleViewController.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 22.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vehicle;
@protocol AddVehicle;

@interface AddVehicleViewController : UITableViewController

@property (nonatomic, weak) id<AddVehicle> sourceController;

@end

@protocol AddVehicle <NSObject>

- (void)addVehicle:(Vehicle *)vehicle;

@end