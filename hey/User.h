//
//  User.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 07.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Message, Vehicle;

@interface User : NSManagedObject

@property (nonatomic, retain) NSData * avatar;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;

@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *myVehicles;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(Message *)value;
- (void)removeMessagesObject:(Message *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addMyVehiclesObject:(Vehicle *)value;
- (void)removeMyVehiclesObject:(Vehicle *)value;
- (void)addMyVehicles:(NSSet *)values;
- (void)removeMyVehicles:(NSSet *)values;

@end
