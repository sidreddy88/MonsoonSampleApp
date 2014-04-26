//
//  CustomControl.m
//  SampleMonsoonProject
//
//  Created by Siddharth Sukumar on 4/24/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "CustomControl.h"
#import <CoreText/CoreText.h>

@interface CustomControl ()

@property (nonatomic, strong) NSAttributedString *attString;
@property (nonatomic, readwrite) NSArray *arcNames;

@end



@implementation CustomControl

@synthesize arcNames, selectedArcIndex, attString;

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {


    }
    return self;
}*/

- (id)initWithFrame:(CGRect)rect andArcNames:(NSArray *)myArcNames
{
    self = [super initWithFrame:rect];
    if (self) {
        self.arcNames = myArcNames;
        self.selectedArcIndex = 0;
    }
    return self;
}



- (void)drawRect:(CGRect)rect

{
    [super drawRect:rect];


   CGContextRef ctx = UIGraphicsGetCurrentContext();


    // drawing the inner circle

    CGContextBeginPath(ctx);


    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, 60.0, 0, 2*M_PI, 0);

    CGContextSaveGState(ctx);
    CGContextSetFillColorWithColor(ctx, [[UIColor colorWithRed:192.0/255.0 green:192.0/255.0 blue:192.0/255.0 alpha:1.0] CGColor]);
    CGContextFillPath(ctx);
    CGContextClip(ctx);
    CGContextStrokePath(ctx);


    CGContextSaveGState(ctx);


    UIBezierPath *aPath;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;

    CGFloat degs = 360/self.arcNames.count;

       // loop to draw the arcs around the circle
    for (int i=0; i<self.arcNames.count; i++) {


          int constantTerm;

          if (i == 0){

             constantTerm = 6;

           } else {
              constantTerm  = 6 + degs;

           }

           startAngle += constantTerm;
            endAngle = startAngle+degs;

        startAngle = startAngle * M_PI/180;
        endAngle = endAngle * M_PI/180;


       // I use Bezier Path to draw the arcs

        aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                           radius:55
                                       startAngle:startAngle
                                         endAngle:endAngle 
                                        clockwise:YES];

        aPath.lineWidth = 2.0;

         [[UIColor colorWithRed:153.0/255.0 green:0 blue:76.0/255.0 alpha:1] setStroke];

         [[UIColor colorWithRed:153.0/255.0 green:0 blue:76.0/255.0 alpha:1] setFill];

         // different color if i is the selected index

          if (i==self.selectedArcIndex) {

        [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] setStroke];

        [[UIColor colorWithRed:1 green:0 blue:0 alpha:1] setFill];


            }

             [aPath fill];
             [aPath stroke];

    } // end of for loop


      // Core text

      // Flip the coordinate system

        CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
        CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
        CGContextScaleCTM(ctx, 1.0, -1.0);

        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(27, 35,  100.0, 50));

        // creating the dictionary of attributes for the NSAttributed string

        CTFontRef fontRef =
        CTFontCreateWithName((CFStringRef)@"Helvetica", 25.0f, NULL);
        NSDictionary *attrDictionary = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)fontRef , (NSString *)kCTFontAttributeName, (id)[[UIColor whiteColor] CGColor], (NSString *) kCTForegroundColorAttributeName, (id)[NSNumber numberWithFloat:-3.0], (NSString *)kCTStrokeWidthAttributeName, nil];
        CFRelease(fontRef);

        NSString *string = (NSString *)self.arcNames[self.selectedArcIndex];
        self.attString = [[NSAttributedString alloc] initWithString:string attributes:attrDictionary];


        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self.attString);
        CTFrameRef theFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [self.attString length]), path, NULL);

        CTFrameDraw(theFrame, ctx);
        CFRelease(framesetter);
        CFRelease(path);

        CFRelease(theFrame);

        CGContextRestoreGState(ctx);


}


-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{

    [super beginTrackingWithTouch:touch withEvent:event];
    self.selectedArcIndex++;
    if (self.selectedArcIndex > self.arcNames.count  - 1){
        self.selectedArcIndex = 0;

    }
    [self setNeedsDisplay];


    //We dont need to track continuously
    return NO;
}



@end
