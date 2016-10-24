 //
//  DIDrawingView.h
//  DrawIt
//
//  Created by ReckyLin on 2016/10/24.
//  Copyright © 2016年 ywl-ios1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIDrawingView : UIView

@property (nonatomic, strong) NSMutableArray *movePoints;


- (void)addPointsToDataSource:(CGPoint)point;

- (void)removeAllPoints;

@end