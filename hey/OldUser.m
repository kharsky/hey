//
//  User.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "OldUser.h"

@implementation OldUser

-(NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, username=%@, password=%@, email=%@>",
            NSStringFromClass([self class]), self, self.username, self.password, self.email];
    
}

@end
