//
//  Message.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "OldMessage.h"

@implementation OldMessage

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, body=%@>",
            NSStringFromClass([self class]), self, self.body];

}
@end
