//
//  iDTViewController.m
//  ImageBlur
//
//  Created by gustavo halperin on 8/29/12.
//  Copyright (c) 2012 iDeasTouch. All rights reserved.
//

#import "iDTViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "UIImage+Filtering.h"
#import "UIImage+Resizing.h"
#import "UIImage+Blurring.h"

@interface iDTViewController ()

@end

@implementation iDTViewController
@synthesize imageView;
@synthesize rasterizationLabel;
@synthesize rasterizationSlider;
@synthesize scaleLabel;
@synthesize scaleSlider;
@synthesize blur1Label;
@synthesize blur1Slider;
@synthesize blur2Label;
@synthesize blur2Slider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image2" ofType:@"png"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
 
    imageView.image = image;
    CALayer *layer = imageView.layer;
    layer.rasterizationScale = 1;
    layer.shouldRasterize = YES;
    
    UIImage *scaled1 = [image scaleByFactor:2];
    UIImage *blurred1 = [scaled1 gaussianBlurWithBias:5];
    UIImage *scaled2 = [blurred1 scaleByFactor:0.5f];
    UIImage *blurred2 = [scaled2 gaussianBlurWithBias:5];
    
    imageView.image = blurred2;

}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setRasterizationLabel:nil];
    [self setRasterizationSlider:nil];
    [self setScaleLabel:nil];
    [self setScaleSlider:nil];
    [self setBlur1Label:nil];
    [self setBlur1Slider:nil];
    [self setBlur2Label:nil];
    [self setBlur2Slider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)rasterizationAction:(id)sender {
}
- (IBAction)scaledAction:(id)sender {
}
- (IBAction)blur1Action:(id)sender {
}
- (IBAction)blur2Action:(id)sender {
}
@end
