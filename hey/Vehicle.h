//
//  Vehicle.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LicenseNumberTypeRegular,
    LicenseNumberTypePublic,
    LicenseNumberTypePolice,
    LicenseNumberTypeOther,
} LicenseNumberType;

typedef enum : NSUInteger {
    VehicleTypePassenger,
    VehicleTypeTruck,
    VehicleTypeSUV,
    VehicleTypeOther,
} VehicleType;

@interface Vehicle : NSObject

@property (nonatomic, copy) NSString *licenseNumber;
@property (nonatomic, assign) LicenseNumberType licenseNumberType;
@property (nonatomic, assign) VehicleType vehicleType;

@end
