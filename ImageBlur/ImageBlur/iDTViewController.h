//
//  iDTViewController.h
//  ImageBlur
//
//  Created by gustavo halperin on 8/29/12.
//  Copyright (c) 2012 iDeasTouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iDTViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *labelView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *rasterizationLabel;
@property (strong, nonatomic) IBOutlet UISlider *rasterizationSlider;
- (IBAction)rasterizationAction:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *blurBiasLabel;
@property (strong, nonatomic) IBOutlet UISlider *blurBiasSlider;
- (IBAction)blurBiasAction:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *blurTimeLabel;
@property (strong, nonatomic) IBOutlet UISlider *blurTimeSlide;
- (IBAction)blurTimeAction:(id)sender;

@end
