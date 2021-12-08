#import "UnityRouter.h"
#import "UnityAdsInstanceMediationSettings.h"
#import "UnityAdsAdapterConfiguration.h"
#import "NSError+UnityAdAdapter.h"

#if __has_include(<MoPub/MoPub.h>)
#import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDK/MoPub.h>)
#import <MoPubSDK/MoPub.h>
#else
#import "MoPub.h"
#endif

@interface UnityAdsAdapterInitializationDelegate : NSObject<UnityAdsInitializationDelegate>
@property(nonatomic, copy) void (^ initializationCompleteBlock)(void);
@property(nonatomic, copy) void (^ initializationFailedBlock)(UnityAdsInitializationError error, NSString *message);
@end

@implementation UnityAdsAdapterInitializationDelegate
- (void)initializationComplete {
    if (self.initializationCompleteBlock) {
        self.initializationCompleteBlock();
    }
}

- (void)initializationFailed:(UnityAdsInitializationError)error withMessage:(nonnull NSString *)message {
    if (self.initializationFailedBlock) {
        self.initializationFailedBlock(error, message);
    }
}
@end

typedef void (^InitCompletionHandler)(NSError*);

@interface UnityRouter ()
@property(nonatomic, strong) NSMutableArray *completionBlocks;
@end

@implementation UnityRouter

- (id) init {
    self = [super init];
    _completionBlocks = [NSMutableArray array];
    return self;
}

+ (UnityRouter *)sharedRouter {
    static UnityRouter * sharedRouter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedRouter = [[UnityRouter alloc] init];
    });
    return sharedRouter;
}

- (void)initializeWithGameId:(NSString *)gameId withCompletionHandler:(void (^)(NSError *))complete {
    if ([UnityAds isInitialized]) {
        if (complete != nil) {
            complete(nil);
        }
        return;
    }
    // If this method was called multiple times from different threads, we want to call all completion handlers once initialization is done.
    if (complete != nil) {
        @synchronized (self.completionBlocks) {
            [self.completionBlocks addObject:complete];
        }
    }
    
    [self setIfUnityAdsCollectsPersonalInfo];
    static dispatch_once_t unityInitToken;
    dispatch_once(&unityInitToken, ^{
        UADSMediationMetaData *mediationMetaData = [[UADSMediationMetaData alloc] init];
        [mediationMetaData setName:@"MoPub"];
        [mediationMetaData setVersion:[[MoPub sharedInstance] version]];
        [mediationMetaData set:@"adapter_version"  value:ADAPTER_VERSION];
        [mediationMetaData commit];
        
        
        UnityAdsAdapterInitializationDelegate *initDelegate = [[UnityAdsAdapterInitializationDelegate alloc] init];
        
        initDelegate.initializationCompleteBlock = ^{
            [[UnityRouter sharedRouter] callCompletionBlocks:nil];
        };
        initDelegate.initializationFailedBlock = ^(UnityAdsInitializationError error, NSString *message) {
            NSError *err = [NSError errorWithAdAdapterErrorCode:MOPUBErrorSDKNotInitialized description:message];
            [[UnityRouter sharedRouter] callCompletionBlocks:err];
        };
        
        [UnityAds initialize:gameId testMode:false initializationDelegate:initDelegate];
        
        [UnityAds setDebugMode:(MPLogging.consoleLogLevel == MPBLogLevelDebug)];
    });
}

- (void) setIfUnityAdsCollectsPersonalInfo
{
    // Collect and pass the user's consent/non-consent from MoPub to the Unity Ads SDK
    UADSMetaData *gdprConsentMetaData = [[UADSMetaData alloc] init];
    
    if ([[MoPub sharedInstance] isGDPRApplicable] == MPBoolYes) {
        if ([[MoPub sharedInstance] allowLegitimateInterest] == YES) {
            if ([[MoPub sharedInstance] currentConsentStatus] == MPConsentStatusDenied
                || [[MoPub sharedInstance] currentConsentStatus] == MPConsentStatusDoNotTrack) {
                
                [gdprConsentMetaData set:@"gdpr.consent" value:@NO];
            }
            else {
                [gdprConsentMetaData set:@"gdpr.consent" value:@YES];
            }
        } else {
            if ([[MoPub sharedInstance] canCollectPersonalInfo] == YES) {
                [gdprConsentMetaData set:@"gdpr.consent" value:@YES];
            }
            else {
                [gdprConsentMetaData set:@"gdpr.consent" value:@NO];
            }
        }
        [gdprConsentMetaData commit];
    }
}

- (void)callCompletionBlocks:(NSError *)error {
    @synchronized (self.completionBlocks) {
        for (InitCompletionHandler block in self.completionBlocks) {
            block(error);
        }
        [self.completionBlocks removeAllObjects];
    }
}

@end
