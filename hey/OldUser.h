//
//  User.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldUser : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, strong) UIImage *avatar;

@property (nonatomic, copy) NSArray *vehicles;
@property (nonatomic, copy) NSArray *messages;

@end
