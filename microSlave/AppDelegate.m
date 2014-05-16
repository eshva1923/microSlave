//
//  AppDelegate.m
//  microSlave
//
//  Created by Federico Brandani on 22/04/14.
//  Copyright (c) 2014 Eshva. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    //self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    //[self.statusItem setHighli]
    [[NSApplication sharedApplication] setActivationPolicy:NSApplicationActivationPolicyAccessory];
}

@end
