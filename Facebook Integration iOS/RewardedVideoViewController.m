//
//  RewardedVideoViewController.m
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 30.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import "RewardedVideoViewController.h"

@interface RewardedVideoViewController ()

@end

@implementation RewardedVideoViewController
FBRewardedVideoAd *rewardedVideoAd;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showRvAds.enabled = NO;
    self.showRvAds.alpha = 0.5;

}

- (IBAction)reqRvAds:(id)sender {
    NSLog(@"reqRvAds called");
    [self loadRewardedVideoAd];
}

- (IBAction)showRvAds:(id)sender {
    NSLog(@"showRvAds called");
    [self showRewardedVideoAd];
    self.showRvAds.enabled = NO;
    self.showRvAds.alpha = 0.5;
    
}

- (void) loadRewardedVideoAd
{
    // 549167759165615_554613408621050 | YOUR_PLACEMENT_ID
    self.rewardedVideoAd = [[FBRewardedVideoAd alloc] initWithPlacementID:@"YOUR_PLACEMENT_ID"];
    self.rewardedVideoAd.delegate = self;
    [self.rewardedVideoAd loadAd];
    
}

- (void)rewardedVideoAd:(FBRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error
{
    NSLog(@"Rewarded video ad failed to load %@", error);
}

- (void)rewardedVideoAdDidLoad:(FBRewardedVideoAd *)rewardedVideoAd
{
    self.showRvAds.enabled = YES;
    self.showRvAds.alpha = 1;
    NSLog(@"Video ad is loaded and ready to be displayed");
    
}

- (void)rewardedVideoAdDidClick:(FBRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"Video ad clicked");
}

- (void)rewardedVideoAdVideoComplete:(FBRewardedVideoAd *)rewardedVideoAd;
{
    NSLog(@"Rewarded Video ad video complete - this is called after a full video view, before the ad end card is shown. You can use this event to initialize your reward");
}
          
- (void)rewardedVideoAdDidClose:(FBRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"Rewarded Video ad closed - this can be triggered by closing the application, or closing the video end card");
}

- (void)rewardedVideoAdWillClose:(FBRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"The user clicked on the close button, the ad is just about to close");
}

- (void)rewardedVideoAdWillLogImpression:(FBRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"Rewarded Video impression is being captured");
}

- (void) showRewardedVideoAd
{
    if (self.rewardedVideoAd && self.rewardedVideoAd.isAdValid) {
        [self.rewardedVideoAd showAdFromRootViewController:self];
    }
}

@end
