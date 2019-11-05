//
//  IntersititalViewController.m
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 30.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import "IntersititalViewController.h"

@interface IntersititalViewController ()

@end

@implementation IntersititalViewController
FBInterstitialAd *interstitialAd;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showIntAds.enabled = NO;
    self.showIntAds.alpha = 0.5;

}

- (IBAction)reqIntAds:(id)sender {
    NSLog(@"reqIntAds called");
    [self loadIntAd];
    
}

- (IBAction)showIntAds:(id)sender {
    NSLog(@"showIntAds called");
    [self showInterstitialAd];
    self.showIntAds.enabled = NO;
    self.showIntAds.alpha = 0.5;
    
}

- (void) loadIntAd
{
    // 549167759165615_552496762166048 | YOUR_PLACEMENT_ID
    self.interstitialAd = [[FBInterstitialAd alloc] initWithPlacementID:@"YOUR_PLACEMENT_ID"];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAd];
    
}

- (void)interstitialAdDidLoad:(FBInterstitialAd *)interstitialAd
{
    self.showIntAds.enabled = YES;
    self.showIntAds.alpha = 1;
    NSLog(@"Ad is loaded and ready to be displayed");
    
}

- (void)interstitialAdWillLogImpression:(FBInterstitialAd *)interstitialAd
{
    NSLog(@"The user sees the add");
    // Use this function as indication for a user's impression on the ad.
}

- (void)interstitialAdDidClick:(FBInterstitialAd *)interstitialAd
{
    NSLog(@"The user clicked on the ad and will be taken to its destination");
    // Use this function as indication for a user's click on the ad.
}

- (void)interstitialAdWillClose:(FBInterstitialAd *)interstitialAd
{
    NSLog(@"The user clicked on the close button, the ad is just about to close");
    // Consider to add code here to resume your app's flow
}

- (void)interstitialAdDidClose:(FBInterstitialAd *)interstitialAd
{
    NSLog(@"Interstitial had been closed");
    // Consider to add code here to resume your app's flow
}

- (void)interstitialAd:(FBInterstitialAd *)interstitialAd didFailWithError:(NSError *)error
{
    NSLog(@" Interstitial Ad failed to load %@", error);
}

- (void) showInterstitialAd
{
    if (self.interstitialAd && self.interstitialAd.isAdValid) {
        // You can now display the full screen ad using this code:
        [self.interstitialAd showAdFromRootViewController:self];
    }
}

@end
