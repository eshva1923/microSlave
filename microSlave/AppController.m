//
//  AppController.m
//  microSlave
//
//  Created by Federico Brandani on 22/04/14.
//  Copyright (c) 2014 Eshva. All rights reserved.
//

#import "AppController.h"

@implementation AppController

-(void)awakeFromNib{

    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self.statusItem  setHighlightMode:YES];
    [self.statusItem setTitle:@"*"];
    [self.statusItem setEnabled:YES];
    [self.statusItem setToolTip:@"prova"];
    [self.statusItem setMenu:self.menu];
    
}

-(IBAction)terminate:(id)sender{
    exit(EXIT_SUCCESS);
}

@end
