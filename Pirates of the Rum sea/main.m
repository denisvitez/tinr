//
//  main.m
//  Pirates of the Rum sea
//
//  Created by tinr on 29/10/14.
//  Copyright (c) 2014 fri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.h"

int main(int argc, char * argv[]) {
    [GameHost load];
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, @"GameHost", @"PiratesGame");
    }
}
