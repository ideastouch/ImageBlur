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
@synthesize blurTimeLabel;
@synthesize blurTimeSlide;
@synthesize blurBiasLabel;
@synthesize blurBiasSlider;
@synthesize labelView;
@synthesize imageView;
@synthesize rasterizationLabel;
@synthesize rasterizationSlider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)uploadImage
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image2" ofType:@"png"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    

    CALayer *labelLayer = labelView.layer;
    labelLayer.rasterizationScale = rasterizationSlider.value;
    labelLayer.shouldRasterize = YES;
    
    imageView.image = image;
    CALayer *layer = imageView.layer;
    layer.rasterizationScale = rasterizationSlider.value;
    layer.shouldRasterize = YES;
    
    
    int loop = 20.01 * blurTimeSlide.value;
    int bias = 5.01 * blurBiasSlider.value;
    for (int i=0; i<loop; i++) {
        //labelView.image = [labelView.image gaussianBlurWithBias:bias];
        imageView.image = [imageView.image gaussianBlurWithBias:bias];
    }
    
    [self.view setNeedsDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    int value;
    
    rasterizationSlider.value = 0.2;
    rasterizationLabel.text = [NSNumber numberWithFloat:rasterizationSlider.value].description;
    
    blurBiasSlider.value = 1.f;
    value = blurBiasSlider.value * 5.01;
    blurBiasLabel.text = [NSNumber numberWithFloat:value].description;
    
    blurTimeSlide.value = 0.5f;
    value = blurTimeSlide.value * 20.01;
    blurTimeLabel.text = [NSNumber numberWithFloat:value].description;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self uploadImage];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setRasterizationLabel:nil];
    [self setRasterizationSlider:nil];
    [self setBlurBiasLabel:nil];
    [self setBlurBiasSlider:nil];
    [self setBlurTimeLabel:nil];
    [self setBlurTimeSlide:nil];
    [self setLabelView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)rasterizationAction:(id)sender {
    UISlider *slider = sender;
    rasterizationLabel.text = [NSNumber numberWithFloat:slider.value].description;
    
    [self uploadImage];
}
- (IBAction)blurBiasAction:(id)sender {
    UISlider *slider = sender;
    int value = 5.01 * slider.value;
    blurBiasLabel.text = [NSNumber numberWithFloat:value].description;
    
    [self uploadImage];
}
- (IBAction)blurTimeAction:(id)sender {
    UISlider *slider = sender;
    int value = 20.01 * slider.value;
    blurTimeLabel.text = [NSNumber numberWithFloat:value].description;
    
    [self uploadImage];
}
@end
