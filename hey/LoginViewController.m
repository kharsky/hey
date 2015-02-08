//
//  LoginViewController.m
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 08.02.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. Проверить существование пользователя  user1:user1
    BOOL userExist = [self isUserExistWithUsername:@"user1" password:@"user1"];
    // 2. Если пользователь существует перейти на следующий экран
    // 3. Если нет, то отобразить

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    // 4. Создать пользователя
    // 5. Перейти на Главный экран

    [self performSegueWithIdentifier:@"ModalTabBarController" sender:nil];
}

- (BOOL)isUserExistWithUsername:(NSString *)username password:(NSString *)password {
    
    __block BOOL isUserExist = NO;

    [self.context performBlockAndWait:^{
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username LIKE[c] 'user1' AND password LIKE[c] 'user1'"];
        [request setPredicate:predicate];
      
        NSError *error = nil;
        NSUInteger count = [self.context countForFetchRequest:request error:&error];
        if (count == NSNotFound) {
            NSLog(@"Error accured while searching user: %@", [error localizedDescription]);
        }
        
        if (count == 0) {
            isUserExist = NO;
        }
        isUserExist = YES;
    }];
  
    return isUserExist;
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
