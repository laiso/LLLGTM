//
//  AppDelegate.m
//  FastLGTM
//

//  Copyright (c) 2014 laiso. All rights reserved.
//

#import "AppDelegate.h"
#import "LLLWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic) LLLWindowController *windowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  self.windowController = [[LLLWindowController alloc] initWithWindowNibName:@"MainWindow"];
  [self.windowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

# pragma mark - IKImageViewDelegate

@end
