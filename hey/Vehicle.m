//
//  Vehicle.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

-(NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, licenseNumber=%@>",
            NSStringFromClass([self class]), self, self.licenseNumber];
}

@end
