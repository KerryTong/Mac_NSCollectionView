//
//  CollectionItemView.h
//  collectionView
//
//  Created by 仝兴伟 on 2017/5/11.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CollectionItemView : NSView

@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) NSCollectionViewItemHighlightState highlightState;
@end
