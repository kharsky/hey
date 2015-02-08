//
//  DataManager.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 31.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OldVehicle;
@class OldMessage;

@interface DataManager : NSObject

+ (id)sharedManager;

- (void)addMyVehicle:(OldVehicle *)vehicle;
- (void)removeMyVehicle:(OldVehicle *)vehicle;
- (NSArray *)myVehicles;

- (void)addMessage:(OldMessage *)message;
- (NSArray *)allMessages;
- (NSArray *)inboxMessages;

@end
