//
//  LLLPictureView.m
//  LLLGTM
//
//  Created by k on 12/13/14.
//  Copyright (c) 2014 laiso. All rights reserved.
//

#import "LLLPictureView.h"

@interface LLLPictureView()

@end

@implementation LLLPictureView

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
  NSPasteboard *pboard = [sender draggingPasteboard];
  if ( [[pboard types] containsObject:NSPasteboardTypeTIFF] ) {
    return NSDragOperationCopy;
  }
  
  return NSDragOperationNone;
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender
{
  return NSDragOperationCopy;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender
{
  return YES;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
  NSImage *image;
  NSPasteboard *pboard = [sender draggingPasteboard];
  if ( [[pboard types] containsObject:NSPasteboardTypeTIFF] ) {
    NSData *data = [pboard dataForType:NSPasteboardTypeTIFF];
    image = [[NSImage alloc] initWithData:data];
  } else if ([[pboard types] containsObject:NSURLPboardType]){
    NSURL *fileURL = [NSURL URLFromPasteboard:pboard];
    image = [[NSImage alloc] initWithContentsOfURL:fileURL];
  }
  
  if (image && [self.delegate respondsToSelector:@selector(pictureView:didSetImage:)]) {
    [self.delegate pictureView:self didSetImage:image];
  }

  return NO;
}

@end
