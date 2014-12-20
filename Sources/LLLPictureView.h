//
//  LLLPictureView.h
//  LLLGTM
//
//  Created by k on 12/13/14.
//  Copyright (c) 2014 laiso. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LLLPictureView;

@protocol LLLPictureViewDelegate <NSObject>

- (void)pictureView:(LLLPictureView *)pictureView didSetImage:(NSImage *)image;

@end

@interface LLLPictureView : NSImageView

@property (nonatomic, weak) IBOutlet id<LLLPictureViewDelegate> delegate;

@end