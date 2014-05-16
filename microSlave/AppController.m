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
//    [self.statusItem setTitle:@"*"];
    [self.statusItem setImage:[NSImage imageNamed:@"menuIcon"]];
    [self.statusItem setEnabled:YES];
    [self.statusItem setToolTip:@"MicroSlave"];
    [self.statusItem setMenu:self.menu];
    [self updateHiddenFilesStatus];
    
}
-(IBAction)switchHiddenFileStatus:(id)sender{
    if([AppController areHiddenFilesShown]){
        [AppController setHiddenFilesShown:NO];
    }else{
        [AppController setHiddenFilesShown:YES];
    }
            [self updateHiddenFilesStatus];
}
-(IBAction)terminate:(id)sender{
    exit(EXIT_SUCCESS);
}

-(void)updateHiddenFilesStatus{
    NSString*hiddenfilestatusString;
    if([AppController areHiddenFilesShown]){hiddenfilestatusString = @"shown";}
    else{hiddenfilestatusString = @"hidden";};
    [_hiddenFileStatus setTitle:[NSString stringWithFormat:@"Hidden files are %@",hiddenfilestatusString]];
}

#pragma mark - low-level functionalities
#pragma mark hidden files functions
+(BOOL)areHiddenFilesShown{
    NSString*result = [AppController runCommand:@"defaults read com.apple.finder AppleShowAllFiles -boolean"];
    if([[result substringToIndex:1]isEqualToString:@"1"] ){return YES;}
    return NO;
}

+(BOOL)setHiddenFilesShown:(BOOL)nv{
    if(nv){[AppController runCommand:@"defaults write com.apple.finder AppleShowAllFiles -boolean true"];
    }else{[AppController runCommand:@"defaults write com.apple.finder AppleShowAllFiles -boolean false"];}
    [AppController runCommand:@"killall Finder"];
    return [AppController areHiddenFilesShown];
}
#pragma mark shell command execution
+(NSString*)runCommand:(NSString *)commandToRun
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    
    NSArray *arguments = [NSArray arrayWithObjects:
                          @"-c" ,
                          [NSString stringWithFormat:@"%@", commandToRun],
                          nil];
    //NSLog(@"run command: %@",commandToRun);
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *output;
    output = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    return output;
}

@end
