## Changelog
  * 4.7.2.1
    * Starting with this version, the latest minor version release of network SDK will be downloaded. For other versions, manually integrate the desired network SDK framework.

  * 4.7.2.0
    * This version of the adapters has been certified with AdColony 4.7.2 and MoPub SDK 5.18.0.

  * 4.7.1.0
    * This version of the adapters has been certified with AdColony 4.7.1 and MoPub SDK 5.18.0.

  * 4.6.1.1
    * Adjust minimium MoPub SDK version from 5.17.0 to 5.17. This allows integrations to use MoPub 5.17.x up to (but not including) 6.0.
    * Service release. No new features. 

  * 4.6.1.0
    * This version of the adapters has been certified with AdColony 4.6.1 and MoPub SDK 5.17.0.

  * 4.6.0.2
    * Add `fullscreenAdAdapterAdWillPresent` and `fullscreenAdAdapterAdDidPresent` to notify publishers of the fullscreen ad show event. Remove `fullscreenAdAdapterAdWillAppear` and  `fullscreenAdAdapterAdDidAppear` as they are now deprecated by the MoPub iOS SDK.
    * Publishers must use v5.17.0 of the MoPub SDK at the minimum.

  * 4.6.0.1
    * Remove deprecated usage of Rewarded Video APIs.

  * 4.6.0.0
    * This version of the adapters has been certified with AdColony 4.6.0 and MoPub SDK 5.16.2.

  * 4.5.0.2
    * Service release. No new features or code changes.

  * 4.5.0.1
    * Add support for `fullscreenAdAdapterAdWillDismiss` when a fullscreen creative is about to close. Publishers must use v5.16.1 of the MoPub SDK at the minimum.

  * 4.5.0.0
    * This version of the adapters has been certified with AdColony 4.5.0 and MoPub SDK 5.15.0.

  * 4.4.1.1.3
    * Replace imports using `MoPubSDKFramework` with `MoPubSDK`. No external impacts to publishers.

  * 4.4.1.1.2
    * Add support for `fullscreenAdAdapterAdDidDismiss:` to signal that the fullscreen ad is closing and the state should be reset. To use this adapter version, you need v5.15.0 of the MoPub iOS SDK at the minimum.

  * 4.4.1.1.1
    * Add functionality on AdColony banner adapters to forward contents of `adm` field in the bid request to AdColony Advanced Bidding requests.

  * 4.4.1.1.0
    * This version of the adapters has been certified with AdColony 4.4.1.1 and MoPub SDK 5.14.1.

  * 4.4.0.0
    * This version of the adapters has been certified with AdColony 4.4.0 and MoPub SDK 5.13.1.

  * 4.3.1.0
    * This version of the adapters has been certified with AdColony 4.3.1 and MoPub SDK 5.13.1.

  * 4.3.0.2
    * Add support for AdColony `Collect Signal` API for Advance Bidding.

  * 4.3.0.1
    * Add functionality on AdColony interstitial and rewarded video adapters to forward contents of `adm` field in the bid request to AdColony Advanced Bidding requests.

  * 4.3.0.0
    * Convert `allZoneIds` parameter for AdColony network configuration from `JSONObject` to `NSArray`. 
    * To pass zone IDs (i.e. via the `allZoneIds` parameter) on `mediatedNetworkConfigurations` during MoPub initialization, starting with this adapter versions, please pass `allZoneIds` entries as an NSArray, like `allZoneIds: ["zone_1", "zone_2"]`. This is mandatory for AdColony Advanced Bidding. More details [here](https://developers.mopub.com/publishers/mediation/networks/adcolony/).
    * This version of the adapters has been certified with AdColony 4.3.0 and MoPub SDK 5.13.1.
    * Note that, while AdColony 4.3.0 supports iOS 14, this adapter version is not certified using iOS 14.
    For iOS 14 compatibility, expect an upcoming adapter release.

  * 4.2.0.2
    * Fix adapter compiler warnings.

  * 4.2.0.1
    * Fix initialization-related crashes when publishers use `MPMoPubConfiguration.mediatedNetworkConfigurations` to initialize AdColony with a dedicated configuration.

  * 4.2.0.0
    * This version of the adapters has been certified with AdColony 4.2.0 and MoPub SDK 5.13.1.

  * 4.1.5.0
    * This version of the adapters has been certified with AdColony 4.1.5 and MoPub SDK 5.13.0.

  * 4.1.4.1
    * Refactor non-native adapter classes to use the new consolidated API from MoPub.
    * To use this and newer adapter versions, you must use MoPub 5.13.0 or newer.
  
  * 4.1.4.0
    * This version of the adapters has been certified with AdColony 4.1.4.

  * 4.1.3.0
    * This version of the adapters has been certified with AdColony 4.1.3.
    * Log the AdColony zone id in ad lifecycle events.

  * 4.1.2.1
    * Add support for banners (introduced in AdColony 4.1.0).
    * Move AdColony parameters handling logic to `AdColonyAdapterConfiguration`.

  * 4.1.2.0
    * This version of the adapters has been certified with AdColony 4.1.2 and is compatible with iOS 13.
  
  * 3.3.8.1.2
    * Stop implementing deprecated request API.

  * 3.3.8.1.1
    * Update extracting zone IDs `initializeNetworkWithConfiguration` to accommodate Unity MoPubManager changes.
    
  * 3.3.8.1.0
    * This version of the adapters has been certified with AdColony 3.3.8.1.

  * 3.3.8.0
    * This version of the adapters has been certified with AdColony 3.3.8.

  * 3.3.7.1
    * Fail the adapters if the app ID and zone ID are empty.

  * 3.3.7.0
    * This version of the adapters has been certified with AdColony 3.3.7.

  * 3.3.5.4
    * Adapters now fetch only the core MoPub iOS SDK (excluding viewability SDKs). Publishers wishing to integrate viewability should fetch the `mopub-ios-sdk` dependency in their own Podfile.

  * 3.3.5.3
    * Update Adapter Version in AdColonyAdapterConfiguration to accommodate podspec changes for Unity releases.

  * 3.3.5.2
    * Move source_files to the `Network` subspec.

  * 3.3.5.1
    * **Note**: This version is only compatible with the 5.5.0+ release of the MoPub SDK.
    * Add the `AdColonyAdapterConfiguration` class to: 
         * pre-initialize the AdColony SDK during MoPub SDK initialization process
         * store adapter and SDK versions for logging purpose
         * return the Advanced Biding token previously returned by `AdColonyAdvancedBidder.m`
    * Streamline adapter logs via `MPLogAdEvent` to make debugging more efficient. For more details, check the [iOS Initialization guide](https://developers.mopub.com/docs/ios/initialization/) and [Writing Custom Events guide](https://developers.mopub.com/docs/ios/custom-events/).
    * Allow supported mediated networks and publishers to opt-in to process a user’s personal data based on legitimate interest basis. More details [here](https://developers.mopub.com/docs/publisher/gdpr-guide/#legitimate-interest-support).

  * 3.3.5.0
    * This version of the adapters has been certified with AdColony 3.3.5.

  * 3.3.4.1
    * Update adapters to be compatible with MoPub iOS SDK framework
    
  * 3.3.4.0
    * This version of the adapters has been certified with AdColony 3.3.4.
    * General Data Protection Regulation (GDPR) update to support a way for publishers to determine GDPR applicability and to obtain/manage consent from users in European Economic Area, the United Kingdom, or Switzerland to serve personalize ads. Only applicable when integrated with MoPub version 5.0.0 and above.
    * Add `AdColonyAdvancedBidder` for publishers using Advaced Bidding.

  * 3.3.0.5
  	* Update import statements for MoPub frameworks

  * 3.3.0.4
  	* Updated the adapter's cocoapods dependency to MoPub version 5.0
  
  * 3.3.0.3
    * This version of the adapters has been certified with AdColony 3.3.0.
    * Podspec version bumped in order to pin the network SDK version.
    
  * 3.3.0.0
    * This version of the adapters has been certified with AdColony 3.3.0.

  * Initial Commit
  	* Adapters moved from [mopub-iOS-sdk](https://github.com/mopub/mopub-ios-sdk) to [mopub-iOS-mediation](https://github.com/mopub/mopub-iOS-mediation/)
