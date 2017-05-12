//
//  AppDelegate.m
//  collectionView
//
//  Created by 仝兴伟 on 2017/5/10.
//  Copyright © 2017年 仝兴伟. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewItem.h"
@interface AppDelegate ()<NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout>

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic, strong) NSArray *content;
@property (nonatomic, strong) NSCollectionView *collectionView;
@property (nonatomic, strong) NSScrollView *collectionContentView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self addCollection];
}

- (void)dataSource {
    NSImage *computerimage = [NSImage imageNamed:NSImageNameComputer];
    NSImage *folderimage = [NSImage imageNamed:NSImageNameFolder];
    NSImage *homeimage = [NSImage imageNamed:NSImageNameHomeTemplate];
    NSImage *listimage = [NSImage imageNamed:NSImageNameListViewTemplate];
    NSImage *networkimage = [NSImage imageNamed:NSImageNameNetwork];
    NSImage *shareimage = [NSImage imageNamed:NSImageNameShareTemplate];
    
    NSDictionary *item1 =@{
                            @"title":@"computer",
                            @"image":computerimage
                            };
    
    NSDictionary *item2 =@{
                           @"title":@"folder",
                           @"image":folderimage};
    
    NSDictionary *item3 =@{
                            @"title":@"home",
                            @"image":homeimage
                            };
    
    NSDictionary *item4 =@{
                           @"title":@"list",
                           @"image":listimage
                           };
    
    NSDictionary *item5 =@{
                           @"title":@"network",
                           @"image":networkimage
                           };
    
    NSDictionary *item6 =@{
                           @"title":@"share",
                           @"image":shareimage
                           };
    
    self.content = @[
                      item1,
                      item2,
                      item3,
                      item4,
                      item5,
                      item6,
                      item1,
                      item2,
                      item3,
                      item4,
                      item5,
                      item6,
                      item1,
                      item2,
                      item3,
                      item4,
                      item5,
                      item6,
                      item1,
                      item2,
                      item3,
                      item4,
                      item5,
                      item6
                      ];
    [self.collectionView reloadData];
}


#pragma mark -- addCollection
- (void)addCollection {
    // 创建scrollview
    NSCollectionViewFlowLayout *layout = [[NSCollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = NSMakeSize(110, 110);
    layout.scrollDirection = NSCollectionViewScrollDirectionVertical;
    layout.sectionInset = NSEdgeInsetsMake(0, 0, 0, 0);
    
//    self.collectionView = [[NSCollectionView alloc]initWithFrame:NSMakeRect(0, 0, 500, 500)];
    
    self.collectionView = [[NSCollectionView alloc]initWithFrame:[self.window.contentView bounds]];

    self.collectionView.collectionViewLayout = layout;

    [self.collectionView registerClass:[CollectionViewItem class] forItemWithIdentifier:@"Slide"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    [self.collectionView setSelectable:YES];
    
//    self.collectionContentView = [[NSScrollView alloc]initWithFrame:NSMakeRect(0, 0, 300, 300)];
    
#pragma mark -- NSScrollView
    self.collectionContentView = [[NSScrollView alloc]initWithFrame:[self.window.contentView bounds]];
#pragma mark -- 给NSScrollView添加自动布局

    
    // 给collectionview添加背景颜色
//    [self.collectionView setWantsLayer:YES];
//    self.collectionView.layer.backgroundColor = [NSColor purpleColor].CGColor;
    
    [self.collectionContentView setDocumentView:self.collectionView];
    [self.window.contentView addSubview:self.collectionContentView];
    
    
    self.collectionContentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.collectionContentView.topAnchor constraintEqualToAnchor:self.window.contentView.topAnchor].active = YES;
    [self.collectionContentView.bottomAnchor constraintEqualToAnchor:self.window.contentView.bottomAnchor].active = YES;
    
    [self.collectionContentView.leadingAnchor constraintEqualToAnchor:self.window.contentView.leadingAnchor].active = YES;
    
    [self.collectionContentView.trailingAnchor constraintEqualToAnchor:self.window.contentView.trailingAnchor].active = YES;

    [self dataSource];
}

#pragma mark -- collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView  {
    return 1;
}


- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.content.count == 0) {
        return 0;
    }
    return self.content.count;
}


//-(NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return NSMakeSize(50, 50);
//}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewItem *item = [collectionView makeItemWithIdentifier:@"Slide" forIndexPath:indexPath];
    item.representedObject = self.content[indexPath.item];
#pragma mark -- item 添加背景颜色
//     [item.view setWantsLayer:YES];
//    [item.view.layer setBackgroundColor:[NSColor redColor].CGColor];
    return item;
}

- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths {
    NSLog(@"----%lu", (unsigned long)collectionView.selectionIndexes.firstIndex);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    [self.window makeKeyAndOrderFront:self];
    return YES;
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

@end
