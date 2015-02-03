//
//  DataManager.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 31.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "DataManager.h"

@interface DataManager ()

@property (nonatomic, strong) NSMutableArray *myVehiclesPrivate;
@property (nonatomic, strong) NSMutableArray *messagesPrivate;

@end

@implementation DataManager

// Pattern Sigleton
+ (id)sharedManager {
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataManager = [[self alloc] init];
    });
    return sharedDataManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _myVehiclesPrivate = [[NSMutableArray alloc] init];
        _messagesPrivate = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Vehicles

- (void)addMyVehicle:(Vehicle *)vehicle {
    [self.myVehiclesPrivate addObject:vehicle];
}

- (void)removeMyVehicle:(Vehicle *)vehicle {
    [self.myVehiclesPrivate removeObject:vehicle];
}

- (NSArray *)myVehicles {
    return [self.myVehiclesPrivate copy];
}

#pragma mark - Messages

- (void)addMessage:(Message *)message {
    [self.messagesPrivate addObject:message];
}

- (NSArray *)allMessages {
    return [self.messagesPrivate copy];
}

- (NSArray *)inboxMessages {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"vehicle IN %@", self.myVehiclesPrivate];
    return [self.messagesPrivate filteredArrayUsingPredicate:predicate];
}


@end


