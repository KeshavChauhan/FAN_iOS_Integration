//
//  ViewController.h
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 26.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FBAudienceNetwork;


@interface ViewController : UIViewController <FBAdViewDelegate>
//@property (weak, nonatomic) IBOutlet UIView *adContainer;
@property (nonatomic, strong) FBAdView *adView;

- (IBAction)refreshBannerAds:(id)sender;

    @end


