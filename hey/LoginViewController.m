//
//  LoginViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 08.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "LoginViewController.h"

#import "User.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    // 4. Создать пользователя
    [self createUserWithUsername:@"user1" password:@"user1" email:@"email@email.com"];
    
    // 5. Перейти на Главный экран

    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)createUserWithUsername:(NSString *)username password:(NSString *)password email:(NSString *)email {
    NSManagedObjectContext *context = self.context;
    
    [context performBlockAndWait:^{
        User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        user.username = username;
        user.password = password;
        user.email = email;
        
        if ([context hasChanges]) {
            NSError *error = nil;
            if (![context save:&error]) {
                NSLog(@"Error accured while searching user: %@", [error localizedDescription]);
            }
        }
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
