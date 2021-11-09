//
//  VungleInstanceMediationSettings.m
//  MoPubSDK
//
//  Copyright (c) 2015 MoPub. All rights reserved.
//

#import "VungleInstanceMediationSettings.h"

@interface VungleInstanceMediationSettings ()

@property (readwrite, assign) BOOL muteIsSet;

@end

@implementation VungleInstanceMediationSettings

@synthesize startMuted = _startMuted;

-(id)init {
    if (self = [super init]) {
        _muteIsSet = NO;
    }
    return self;
}

-(BOOL)startMuted
{
    return _startMuted;
}

-(void)setStartMuted:(BOOL)startMuted
{
    _startMuted = startMuted;
    self.muteIsSet = YES;
}

@end
