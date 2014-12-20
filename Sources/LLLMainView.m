//
//  FLGMainView.m
//  FastLGTM
//

//  Copyright (c) 2014 laiso. All rights reserved.
//

#import "LLLMainView.h"

@interface LLLMainView() 

@end

@implementation LLLMainView

- (id)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self){
    [self registerForDraggedTypes:@[NSPasteboardTypeTIFF]];
  }
  
  return self;
}

@end
