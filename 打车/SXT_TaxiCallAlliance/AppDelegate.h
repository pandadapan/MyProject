//
//  AppDelegate.h
//  SXT_TaxiCallAlliance
//
//  Created by ts on 17/5/12.
//  Copyright © 2017年 PAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

