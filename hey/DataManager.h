//
//  DataManager.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 31.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vehicle;
@class Messages;

@interface DataManager : NSObject

+ (id)sharedManager;

- (void)addMyVehicle:(Vehicle *)vehicle;
- (void)removeMyVehicle:(Vehicle *)vehicle;
- (NSArray *)myVehicles;

- (void)addMessage:(Messages *)message;
- (NSArray *)allMessages;
- (NSArray *)inboxMessages;

@end
