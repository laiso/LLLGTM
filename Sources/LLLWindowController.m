//
//  LLLEditWindowController.m
//  LLLGTM
//
//  Created by k on 12/20/14.
//  Copyright (c) 2014 laiso. All rights reserved.
//

#import "LLLWindowController.h"
#import "LLLMainViewController.h"

@interface LLLWindowController ()

@property (nonatomic, weak) IBOutlet NSView *myView;
@property (nonatomic) NSViewController *mainViewController;

@end

@implementation LLLWindowController

- (void)windowDidLoad
{
  [super windowDidLoad];
  self.mainViewController = [[LLLMainViewController alloc] init];
  [self.myView addSubview:self.mainViewController.view];
}

@end
