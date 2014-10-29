//
//  DetailViewController.h
//  Pirates of the Rum sea
//
//  Created by tinr on 29/10/14.
//  Copyright (c) 2014 fri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

