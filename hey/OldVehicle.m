//
//  Vehicle.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "OldVehicle.h"

@implementation OldVehicle

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, licenseNumber=%@>",
            NSStringFromClass([self class]), self, self.licenseNumber];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[OldVehicle class]])
        return NO;
    
    OldVehicle *vehicle = (OldVehicle *)object;
    return [self.licenseNumber isEqualToString:vehicle.licenseNumber];
}

@end
