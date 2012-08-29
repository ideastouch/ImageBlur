//
//  iDTViewController.h
//  ImageBlur
//
//  Created by gustavo halperin on 8/29/12.
//  Copyright (c) 2012 iDeasTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iDTViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *rasterizationLabel;
@property (strong, nonatomic) IBOutlet UISlider *rasterizationSlider;
- (IBAction)rasterizationAction:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *scaleLabel;
@property (strong, nonatomic) IBOutlet UISlider *scaleSlider;
- (IBAction)scaledAction:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *blur1Label;
@property (strong, nonatomic) IBOutlet UISlider *blur1Slider;
- (IBAction)blur1Action:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *blur2Label;
@property (strong, nonatomic) IBOutlet UISlider *blur2Slider;
- (IBAction)blur2Action:(id)sender;


@end
