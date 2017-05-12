//
//  CollectionViewItem.m
//  collectionView
//
//  Created by 仝兴伟 on 2017/5/10.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "CollectionViewItem.h"

#import "CollectionItemView.h"
@interface CollectionViewItem ()
@property (weak) IBOutlet NSImageView *collImageView;
@property (weak) IBOutlet NSTextField *titleField;

@end

@implementation CollectionViewItem
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
}

- (void)viewWillAppear {
    if(!self.representedObject){
        return;
    }
    self.collImageView.image = [self.representedObject objectForKey:@"image"];
    self.titleField.stringValue = [self.representedObject objectForKey:@"title"];

}



// 重写选中方法
- (void)setSelected:(BOOL)selected
{
    [(CollectionItemView *)[self view] setIsSelected:selected];
    [super setSelected:selected];
}

@end
