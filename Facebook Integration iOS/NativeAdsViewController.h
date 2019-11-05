//
//  NativeAdsViewController.h
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 30.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FBAudienceNetwork;

NS_ASSUME_NONNULL_BEGIN

@interface NativeAdsViewController : UIViewController <FBNativeAdDelegate, FBMediaViewDelegate>
- (IBAction)reqNativeAds:(id)sender;
- (IBAction)showNativeAds:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showNativeAds;
@property (weak, nonatomic) IBOutlet FBMediaView *adIconView;
@property (weak, nonatomic) IBOutlet FBMediaView *adCoverMediaView;
@property (weak, nonatomic) IBOutlet UILabel *adBodyLabel;
@property (weak, nonatomic) IBOutlet UIButton *adCallToActionButton;
@property (weak, nonatomic) IBOutlet UILabel *adSocialContextLabel;
@property (weak, nonatomic) IBOutlet UILabel *adTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sponsoredLabel;
@property (weak, nonatomic) IBOutlet FBAdOptionsView *adOptionsView;
@property (weak, nonatomic) IBOutlet UIView *adUIView;
@property (strong, nonatomic) FBNativeAd *nativeAd;

@end

NS_ASSUME_NONNULL_END
