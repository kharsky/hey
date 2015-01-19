//
//  Message.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vehicle;

@interface Message : NSObject

@property (nonatomic, copy) NSString *body;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) NSDate *timestamp;
@property (nonatomic, strong) Vehicle *vehicle;

@end
