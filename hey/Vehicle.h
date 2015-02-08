//
//  Vehicle.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 07.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum : int16_t {
    LicenseNumberTypeRegular,
    LicenseNumberTypePublic,
    LicenseNumberTypePolice,
    LicenseNumberTypeOther,
} LicenseNumberType;

typedef enum : int16_t {
    VehicleTypePassenger,
    VehicleTypeTruck,
    VehicleTypeSUV,
    VehicleTypeOther,
} VehicleType;

@class Message, User;

@interface Vehicle : NSManagedObject

@property (nonatomic, retain) NSString * licenseNumber;
@property (nonatomic) LicenseNumberType licenseNumberType;
@property (nonatomic) VehicleType vehicleType;

@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *owners;

@end

@interface Vehicle (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(Message *)value;
- (void)removeMessagesObject:(Message *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addOwnersObject:(User *)value;
- (void)removeOwnersObject:(User *)value;
- (void)addOwners:(NSSet *)values;
- (void)removeOwners:(NSSet *)values;

@end
