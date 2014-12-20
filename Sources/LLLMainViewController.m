//
//  LLLMainViewController.m
//  LLLGTM
//
//  Created by k on 12/20/14.
//  Copyright (c) 2014 laiso. All rights reserved.
//

#import "LLLMainViewController.h"
#import "LLLPictureView.h"

@interface LLLMainViewController () <LLLPictureViewDelegate>

@property (nonatomic) IBOutlet NSTextField *dropHereLabel;
@property (nonatomic) IBOutlet NSTextField *textField;
@property (nonatomic) IBOutlet LLLPictureView *pictureView;

@end

@implementation LLLMainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.pictureView registerForDraggedTypes:@[NSPasteboardTypeTIFF, NSURLPboardType]];
  [self configurePictureViewWithSize:CGSizeMake(NSWidth(self.view.bounds), NSHeight(self.view.bounds))];
}

- (void)configurePictureViewWithSize:(CGSize)size
{
  self.pictureView.frame = CGRectMake((NSWidth(self.view.bounds)-size.width)/2,
                                      (NSHeight(self.view.bounds)-size.height)/2,
                                      size.width, size.height);
  self.pictureView.bounds = self.pictureView.frame;
}

- (void)pictureView:(LLLPictureView *)thePictureView didSetImage:(NSImage *)image
{
  self.dropHereLabel.hidden = YES;
  
  [self configurePictureViewWithSize:image.size];
  self.pictureView.image = image;
  
  [self.textField removeFromSuperview];
  self.textField.font = [NSFont fontWithName:@"Impact" size:(image.size.width+image.size.height) * 0.10];
  [self.textField sizeToFit];
  self.textField.frame = CGRectMake((NSWidth(self.pictureView.bounds)-NSWidth(self.textField.frame))/2 + NSMinX(self.pictureView.bounds),
                                    NSMinY(self.pictureView.bounds),
                                    NSWidth(self.textField.frame), NSHeight(self.textField.frame));
  [self.pictureView addSubview:self.textField];
  
#ifdef DEBUG
  [self saveImageFile];
#endif
  [self copyToPastebpard];
}

- (NSImage *)capturedImage
{
  CGRect rect = self.pictureView.bounds;
  NSBitmapImageRep *bitmap = [self.view bitmapImageRepForCachingDisplayInRect:rect];
  [bitmap setSize:rect.size];
  [self.view cacheDisplayInRect:rect toBitmapImageRep:bitmap];
  
  NSImage* image = [[NSImage alloc] initWithSize:rect.size];
  [image addRepresentation:bitmap];
  return image;
}

- (NSData *)capturedImageData
{
  NSImage *capturedImage = [self capturedImage];
  NSBitmapImageRep *imgRep = [[capturedImage representations] objectAtIndex:0];
  return [imgRep representationUsingType:NSPNGFileType properties:nil];
}

- (void)copyToPastebpard
{
  NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
  [pasteboard clearContents];
  NSData *data = [self capturedImageData];
  [pasteboard setData:data forType:NSPasteboardTypePNG];
}

- (void)saveImageFile
{
  NSData *data = [self capturedImageData];
  [data writeToFile:@"/tmp/so_lai_lllgtm_degub.png" atomically:YES];
}

@end
