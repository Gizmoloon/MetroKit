//
//  MKReactiveContentsButton.m
//  Used in Metroa
//
//  Created by Glenn Forbes on 24/05/2013.
//  Copyright (c) 2013 Glenn Forbes. All rights reserved.
//

#import "MKReactiveContentsButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation MKReactiveContentsButton

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    
    
    CGRect frame = self.layer.frame;
    self.layer.anchorPoint = CGPointMake(point.x / self.frame.size.width, point.y / self.frame.size.height);
    self.layer.frame = frame;
    [UIView animateWithDuration:0.2 delay:0 options:kNilOptions animations:^
     {
         CATransform3D transP = CATransform3DMakeRotation(3.14/8, 1, 1, 0);
         transP.m34 = 1.0 / -500;
         self.layer.contentsScale = [[UIScreen mainScreen] scale];
         self.layer.transform = transP;
     }completion:^(BOOL done)
     {}];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [UIView animateWithDuration:0.2 delay:0 options:kNilOptions animations:^
     {
         self.layer.contentsScale = [[UIScreen mainScreen] scale];
         self.layer.transform = CATransform3DIdentity;
     } completion:^(BOOL done)
     {}];
}

@end
