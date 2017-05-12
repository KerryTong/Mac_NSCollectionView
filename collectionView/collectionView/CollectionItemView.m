//
//  CollectionItemView.m
//  collectionView
//
//  Created by 仝兴伟 on 2017/5/11.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "CollectionItemView.h"

@implementation CollectionItemView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect imageRect = NSMakeRect(5,5,self.frame.size.width -10,self.frame.size.height -10);
    NSBezierPath* imageRoundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect:imageRect xRadius: 4 yRadius: 4];
    NSColor* fillColor = nil;
    NSColor* strokeColor = nil;
    
    //默认是未选中的
    if (_isSelected) {
        
        fillColor = [NSColor colorWithCalibratedRed: 0.851 green: 0.851 blue: 0.851 alpha: 1];
        strokeColor = [NSColor colorWithCalibratedRed: 0.408 green: 0.592 blue: 0.855 alpha: 1];
        
    }else{
        
        fillColor = [NSColor clearColor];
        strokeColor = [NSColor colorWithCalibratedRed: 0.749 green: 0.749 blue: 0.749 alpha: 1];
    }
    
    [fillColor setFill];
    [imageRoundedRectanglePath fill];
    [strokeColor setStroke];
    
    [super drawRect:dirtyRect];
    
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    [self setNeedsDisplay:YES];
}


@end
