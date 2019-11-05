//
//  RewardedVideoViewController.h
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 30.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@import FBAudienceNetwork;

NS_ASSUME_NONNULL_BEGIN

@interface RewardedVideoViewController : UIViewController <FBRewardedVideoAdDelegate>

- (IBAction)reqRvAds:(id)sender;
- (IBAction)showRvAds:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showRvAds;
@property (nonatomic, strong) FBRewardedVideoAd *rewardedVideoAd;


@end

NS_ASSUME_NONNULL_END
