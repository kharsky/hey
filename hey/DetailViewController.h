//
//  DetailViewController.h
//  hey
//
//  Created by KONSTANTIN KHARSKIY on 14.01.15.
//  Copyright (c) 2015 KONSTANTIN KHARSKIY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

