//
//  AppController.h
//  microSlave
//
//  Created by Federico Brandani on 22/04/14.
//  Copyright (c) 2014 Eshva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
@property(nonatomic,strong)NSStatusItem*statusItem;
@property(nonatomic,strong)IBOutlet NSMenu*menu;

-(IBAction)terminate:(id)sender;
@end
