//
//  IntersititalViewController.h
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 30.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FBAudienceNetwork;

NS_ASSUME_NONNULL_BEGIN

@interface IntersititalViewController : UIViewController <FBInterstitialAdDelegate>

- (IBAction)reqIntAds:(id)sender;
- (IBAction)showIntAds:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showIntAds;
@property (nonatomic, strong) FBInterstitialAd *interstitialAd;


@end

NS_ASSUME_NONNULL_END
