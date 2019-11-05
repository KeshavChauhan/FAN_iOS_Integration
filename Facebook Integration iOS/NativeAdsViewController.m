//
//  NativeAdsViewController.m
//  Facebook Integration iOS
//
//  Created by Keshav Priyadarshi on 30.10.19.
//  Copyright © 2019 Keshav Priyadarshi. All rights reserved.
//

#import "NativeAdsViewController.h"

@interface NativeAdsViewController ()

@end

@implementation NativeAdsViewController
FBNativeAd *nativeAd;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showNativeAds.enabled = NO;
    self.showNativeAds.alpha = 0.5;

}

- (IBAction)reqNativeAds:(id)sender {
    NSLog(@"reqNativeAds called");
    [self loadAd];
}

- (IBAction)showNativeAds:(id)sender {
    NSLog(@"showNativeAds called");
    [self showNativeAd];
    self.showNativeAds.enabled = NO;
    self.showNativeAds.alpha = 0.5;
}

- (void) loadAd
{
    // 549167759165615_554612345287823 | YOUR_PLACEMENT_ID
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:@"YOUR_PLACEMENT_ID"];
    nativeAd.delegate = self;
    [nativeAd loadAd];
}

- (void)nativeAdDidLoad:(FBNativeAd *)nativeAd
{
    //self.adCoverMediaView.delegate = self;
    // [nativeAd downloadMedia];
    self.nativeAd = nativeAd;
    self.showNativeAds.enabled = YES;
    self.showNativeAds.alpha = 1;
    //[self showNativeAd];
}

- (void)showNativeAd
{
    if (self.nativeAd && self.nativeAd.isAdValid) {
        [self.nativeAd unregisterView];
        
        // Wire up UIView with the native ad; only call to action button and media view will be clickable.
        [self.nativeAd registerViewForInteraction:self.adUIView
                                        mediaView:self.adCoverMediaView
                                         iconView:self.adIconView
                                   viewController:self
                                   clickableViews:@[self.adCallToActionButton, self.adCoverMediaView]];
        
        // Render native ads onto UIView
        self.adTitleLabel.text = self.nativeAd.advertiserName;
        self.adBodyLabel.text = self.nativeAd.bodyText;
        self.adSocialContextLabel.text = self.nativeAd.socialContext;
        self.sponsoredLabel.text = self.nativeAd.sponsoredTranslation;
        [self.adCallToActionButton setTitle:self.nativeAd.callToAction
                                   forState:UIControlStateNormal];
        self.adOptionsView.nativeAd = self.nativeAd;
    }
}

- (void)mediaViewDidLoad:(FBMediaView *)mediaView
{
    CGFloat currentAspect = mediaView.frame.size.width / mediaView.frame.size.height;
    NSLog(@"current aspect of media view: %f", currentAspect);
    
    CGFloat actualAspect = mediaView.aspectRatio;
    NSLog(@"actual aspect of media view: %f", actualAspect);
}

- (void)nativeAdDidClick:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad was clicked.");
}

- (void)nativeAdDidFinishHandlingClick:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad did finish click handling.");
}

- (void)nativeAdWillLogImpression:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad impression is being captured.");
}

- (void)nativeAd:(FBNativeAd *)nativeAd didFailWithError:(NSError *)error
{
    NSLog(@"Native ad failed to load with error: %@", error);
}

@end
