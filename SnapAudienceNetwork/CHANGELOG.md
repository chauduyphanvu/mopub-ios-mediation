## Changelog
* 2.0.0.1
  * Starting with this version, the latest minor version release of network SDK will be downloaded. For other versions, manually integrate the desired network SDK framework.

* 2.0.0.0
  * This version of the adapters has been certified with SnapAudienceNetwork 2.0.0 and MoPub SDK 5.18.0.
  * Add support for Advanced Bidding.

* 1.1.2.1
  * Adjust minimium MoPub SDK version from 5.17.0 to 5.17. This allows integrations to use MoPub 5.17.x up to (but not including) 6.0.
  * Service release. No new features. 

* 1.1.2.0
  * This version of the adapters has been certified with SnapAudienceNetwork 1.1.2 and MoPub SDK 5.17.0.
  * Implement `rootViewController` delegate property in `SnapAdBannerCustomEvent` instead of deprecated `[SAKAdView rootViewController]` property.

* 1.1.1.1
  * Fix the auto-property synthesis compiler warnings for `SnapAdIntersititalCustomEvent`.
  
* 1.1.1.0
  * This version of the adapters has been certified with SnapAudienceNetwork 1.1.1 and MoPub SDK 5.17.0.

* 1.1.0.1
  * Add `fullscreenAdAdapterAdWillPresent` and `fullscreenAdAdapterAdDidPresent` to notify publishers of the fullscreen ad show event. Remove `fullscreenAdAdapterAdWillAppear` and  `fullscreenAdAdapterAdDidAppear` as they are now deprecated by the MoPub iOS SDK.
  * Publishers must use v5.17.0 of the MoPub SDK at the minimum.

* 1.1.0.0
  * This version of the adapters has been certified with SnapAudienceNetwork 1.1.0 and MoPub SDK 5.16.2.

* 1.0.8.1
  * Remove deprecated usage of Rewarded Video APIs.

* 1.0.8.0
  * This version of the adapters has been certified with SnapAudienceNetwork 1.0.8 and MoPub SDK 5.16.2.

* 1.0.7.2
  * Add support for `fullscreenAdAdapterAdWillDismiss` when a fullscreen creative is about to close. Publishers must use v5.16.1 of the MoPub SDK at the minimum.

* 1.0.7.1
  * Service release. No new features/changes.

* 1.0.7.0
  * This version of the adapters has been certified with SnapAudienceNetwork 1.0.7 and MoPub SDK 5.15.0.

* 1.0.6.4
  * Replace imports using `MoPubSDKFramework` with `MoPubSDK`. No external impacts to publishers.

* 1.0.6.3
  * Service release. No new features/changes.

* 1.0.6.2
  * Add support for `fullscreenAdAdapterAdDidDismiss:` to signal that the fullscreen ad is closing and the state should be reset. To use this adapter version, you need v5.15.0 of the MoPub iOS SDK at the minimum.

* 1.0.6.1
  * Update adapters to be compatible with MoPub iOS SDK framework.

* 1.0.6.0
  * This version of the adapters has been certified with SnapAudienceNetwork 1.0.6 and MoPub SDK 5.14.1.