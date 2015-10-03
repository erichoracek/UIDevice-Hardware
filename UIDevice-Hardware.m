/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk

 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#include <sys/sysctl.h>
#import "UIDevice-Hardware.h"

static NSDictionary *modelIdentifierNameMap;

@interface UIDevice (Hardward)

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier;

@end

@implementation UIDevice (Hardware)

+ (void)initialize
{
    modelIdentifierNameMap = @{
       // iPhone http://theiphonewiki.com/wiki/IPhone

       @"iPhone1,1": @"iPhone 1G",
       @"iPhone1,2": @"iPhone 3G",
       @"iPhone2,1": @"iPhone 3GS",
       @"iPhone3,1": @"iPhone 4 (GSM)",
       @"iPhone3,2": @"iPhone 4 (GSM Rev A)",
       @"iPhone3,3": @"iPhone 4 (CDMA)",
       @"iPhone4,1": @"iPhone 4S",
       @"iPhone5,1": @"iPhone 5 (GSM)",
       @"iPhone5,2": @"iPhone 5 (Global)",
       @"iPhone5,3": @"iPhone 5c (GSM)",
       @"iPhone5,4": @"iPhone 5c (Global)",
       @"iPhone6,1": @"iPhone 5s (GSM)",
       @"iPhone6,2": @"iPhone 5s (Global)",
       @"iPhone7,1": @"iPhone 6 Plus",
       @"iPhone7,2": @"iPhone 6",
       @"iPhone8,1": @"iPhone 6s",
       @"iPhone8,2": @"iPhone 6s Plus",

       // iPad http://theiphonewiki.com/wiki/IPad

       @"iPad1,1": @"iPad 1G",
       @"iPad2,1": @"iPad 2 (Wi-Fi)",
       @"iPad2,2": @"iPad 2 (GSM)",
       @"iPad2,3": @"iPad 2 (CDMA)",
       @"iPad2,4": @"iPad 2 (Rev A)",
       @"iPad3,1": @"iPad 3 (Wi-Fi)",
       @"iPad3,2": @"iPad 3 (GSM)",
       @"iPad3,3": @"iPad 3 (Global)",
       @"iPad3,4": @"iPad 4 (Wi-Fi)",
       @"iPad3,5": @"iPad 4 (GSM)",
       @"iPad3,6": @"iPad 4 (Global)",

       @"iPad4,1": @"iPad Air (Wi-Fi)",
       @"iPad4,2": @"iPad Air (Cellular)",
       @"iPad5,3": @"iPad Air 2 (Wi-Fi)",
       @"iPad5,4": @"iPad Air 2 (Cellular)",

       // iPad Mini http://theiphonewiki.com/wiki/IPad_mini

       @"iPad2,5": @"iPad mini 1G (Wi-Fi)",
       @"iPad2,6": @"iPad mini 1G (GSM)",
       @"iPad2,7": @"iPad mini 1G (Global)",
       @"iPad4,4": @"iPad mini 2G (Wi-Fi)",
       @"iPad4,5": @"iPad mini 2G (Cellular)",
       @"iPad4,6": @"iPad mini 2G (Cellular)", // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
       @"iPad4,7": @"iPad mini 3G (Wi-Fi)",
       @"iPad4,8": @"iPad mini 3G (Cellular)",
       @"iPad4,9": @"iPad mini 3G (Cellular)",

       // iPod http://theiphonewiki.com/wiki/IPod

       @"iPod1,1": @"iPod touch 1G",
       @"iPod2,1": @"iPod touch 2G",
       @"iPod3,1": @"iPod touch 3G",
       @"iPod4,1": @"iPod touch 4G",
       @"iPod5,1": @"iPod touch 5G",
       @"iPod7,1": @"iPod touch 6G", // as 6,1 was never released 7,1 is actually 6th generation

       // Apple TV
       @"AppleTV5,3": @"Apple TV 4G"
    };
}

- (NSString *)getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);

    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);

    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];

    free(answer);
    return results;
}

- (NSString *)modelIdentifier
{
    return [self getSysInfoByName:"hw.machine"];
}

- (NSString *)modelName
{
    return [self modelNameForModelIdentifier:[self modelIdentifier]];
}

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier
{
    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }

    return modelIdentifierNameMap[modelIdentifier] ?: modelIdentifier;
}

- (UIDeviceFamily) deviceFamily
{
    NSString *modelIdentifier = [self modelIdentifier];
    if ([modelIdentifier hasPrefix:@"iPhone"]) return UIDeviceFamilyiPhone;
    if ([modelIdentifier hasPrefix:@"iPod"]) return UIDeviceFamilyiPod;
    if ([modelIdentifier hasPrefix:@"iPad"]) return UIDeviceFamilyiPad;
    if ([modelIdentifier hasPrefix:@"AppleTV"]) return UIDeviceFamilyAppleTV;
    return UIDeviceFamilyUnknown;
}

@end
