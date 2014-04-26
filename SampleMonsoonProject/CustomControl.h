//
//  CustomControl.h
//  SampleMonsoonProject
//
//  Created by Siddharth Sukumar on 4/24/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomControl : UIControl

@property (nonatomic, readonly) NSArray *arcNames;
@property int selectedArcIndex;


- (id)initWithFrame:(CGRect)rect andArcNames:(NSArray *)arcNames;


@end
