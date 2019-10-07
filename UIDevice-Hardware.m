/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk

 Modified by Eric Horacek for Monospace Ltd. on 2/4/13
 */

#include <sys/sysctl.h>
#import "UIDevice-Hardware.h"

@interface UIDevice (Hardward)

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier;

@end

@implementation UIDevice (Hardware)

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
    // iPhone http://theiphonewiki.com/wiki/IPhone

    if ([modelIdentifier isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([modelIdentifier isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (GSM Rev A)";
    if ([modelIdentifier isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([modelIdentifier isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([modelIdentifier isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([modelIdentifier isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([modelIdentifier isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([modelIdentifier isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([modelIdentifier isEqualToString:@"iPhone10,1"])   return @"iPhone 8";          // US (Verizon), China, Japan
    if ([modelIdentifier isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";     // US (Verizon), China, Japan
    if ([modelIdentifier isEqualToString:@"iPhone10,3"])   return @"iPhone X";          // US (Verizon), China, Japan
    if ([modelIdentifier isEqualToString:@"iPhone10,4"])   return @"iPhone 8";          // AT&T, Global
    if ([modelIdentifier isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";     // AT&T, Global
    if ([modelIdentifier isEqualToString:@"iPhone10,6"])   return @"iPhone X";          // AT&T, Global
    if ([modelIdentifier isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([modelIdentifier isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    if ([modelIdentifier isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max (China)"; // China dual-sim
    if ([modelIdentifier isEqualToString:@"iPhone11,8"])   return @"iPhone XR";

    // iPad http://theiphonewiki.com/wiki/IPad

    if ([modelIdentifier isEqualToString:@"iPad1,1"])      return @"iPad 1G";
    if ([modelIdentifier isEqualToString:@"iPad2,1"])      return @"iPad 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"])      return @"iPad 2 (Rev A)";
    if ([modelIdentifier isEqualToString:@"iPad3,1"])      return @"iPad 3 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"])      return @"iPad 3 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad3,4"])      return @"iPad 4 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"])      return @"iPad 4 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad6,11"])     return @"iPad (5th gen) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad6,12"])     return @"iPad (5th gen) (Cellular)";

    if ([modelIdentifier isEqualToString:@"iPad4,1"])      return @"iPad Air (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";

    if ([modelIdentifier isEqualToString:@"iPad7,5"])      return @"iPad 6G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad7,6"])      return @"iPad 6G (Cellular)";

    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini

    if ([modelIdentifier isEqualToString:@"iPad2,5"])      return @"iPad mini 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"])      return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"])      return @"iPad mini 1G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,6"])      return @"iPad mini 2G (Cellular)"; // TD-LTE model see https://support.apple.com/en-us/HT201471#iPad-mini2
    if ([modelIdentifier isEqualToString:@"iPad4,7"])      return @"iPad mini 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad4,8"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad4,9"])      return @"iPad mini 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad5,1"])      return @"iPad mini 4G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad5,2"])      return @"iPad mini 4G (Cellular)";

    // iPad Pro https://www.theiphonewiki.com/wiki/IPad_Pro

    if ([modelIdentifier isEqualToString:@"iPad6,3"])      return @"iPad Pro (9.7 inch) 1G (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=9938&c=apple_ipad_pro_9.7-inch_a1673_wifi_32gb_apple_ipad_6,3
    if ([modelIdentifier isEqualToString:@"iPad6,4"])      return @"iPad Pro (9.7 inch) 1G (Cellular)"; // http://pdadb.net/index.php?m=specs&id=9981&c=apple_ipad_pro_9.7-inch_a1675_td-lte_32gb_apple_ipad_6,4
    if ([modelIdentifier isEqualToString:@"iPad6,7"])      return @"iPad Pro (12.9 inch) 1G (Wi-Fi)"; // http://pdadb.net/index.php?m=specs&id=8960&c=apple_ipad_pro_wifi_a1584_128gb
    if ([modelIdentifier isEqualToString:@"iPad6,8"])      return @"iPad Pro (12.9 inch) 1G (Cellular)"; // http://pdadb.net/index.php?m=specs&id=8965&c=apple_ipad_pro_td-lte_a1652_32gb_apple_ipad_6,8
    if ([modelIdentifier isEqualToString:@"iPad7,1"])      return @"iPad Pro (12.9 inch) 2G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad7,2"])      return @"iPad Pro (12.9 inch) 2G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad7,3"])      return @"iPad Pro (10.5 inch) 1G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad7,4"])      return @"iPad Pro (10.5 inch) 1G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,1"])      return @"iPad Pro (11 inch) (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,2"])      return @"iPad Pro (11 inch) (Wi-Fi)"; // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,3"])      return @"iPad Pro (11 inch) (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,4"])      return @"iPad Pro (11 inch) (Cellular)"; // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,5"])      return @"iPad Pro (12.9 inch) 3G (Wi-Fi)";
    if ([modelIdentifier isEqualToString:@"iPad8,6"])      return @"iPad Pro (12.9 inch) 3G (Wi-Fi)";  // 6GB RAM version, up to 1TB disk
    if ([modelIdentifier isEqualToString:@"iPad8,7"])      return @"iPad Pro (12.9 inch) 3G (Cellular)";
    if ([modelIdentifier isEqualToString:@"iPad8,8"])      return @"iPad Pro (12.9 inch) 3G (Cellular)"; // 6GB RAM version, up to 1TB disk

    // iPod http://theiphonewiki.com/wiki/IPod

    if ([modelIdentifier isEqualToString:@"iPod1,1"])      return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"])      return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"])      return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"])      return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"])      return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"])      return @"iPod touch 6G"; // as 6,1 was never released 7,1 is actually 6th generation

    // Apple TV https://www.theiphonewiki.com/wiki/Apple_TV

    if ([modelIdentifier isEqualToString:@"AppleTV1,1"])      return @"Apple TV 1G";
    if ([modelIdentifier isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3G";
    if ([modelIdentifier isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3G"; // small, incremental update over 3,1
    if ([modelIdentifier isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4G"; // as 4,1 was never released, 5,1 is actually 4th generation
    if ([modelIdentifier isEqualToString:@"AppleTV6,2"])      return @"Apple TV (4K)";

    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"])
    {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }

    return modelIdentifier;
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

- (CGFloat) ppi
{
    // sources
    // https://en.wikipedia.org/wiki/List_of_iOS_devices
    // https://en.wikipedia.org/wiki/IPad

    NSString *machineId = [self modelIdentifier];

    // iPad

    if ([machineId isEqualToString:@"iPad1,1"]) return 132; // 1st gen ipad
    if ([machineId isEqualToString:@"iPad2,1"]) return 132; // ipad 2
    if ([machineId isEqualToString:@"iPad2,2"]) return 132; // ipad 2
    if ([machineId isEqualToString:@"iPad2,3"]) return 132; // ipad 2
    if ([machineId isEqualToString:@"iPad2,4"]) return 132; // ipad 2
    if ([machineId isEqualToString:@"iPad3,1"]) return 264; // iPad 3
    if ([machineId isEqualToString:@"iPad3,2"]) return 264; // iPad 3
    if ([machineId isEqualToString:@"iPad3,3"]) return 264; // iPad 3
    if ([machineId isEqualToString:@"iPad3,4"]) return 264; // iPad 4
    if ([machineId isEqualToString:@"iPad3,5"]) return 264; // iPad 4
    if ([machineId isEqualToString:@"iPad3,6"]) return 264; // iPad 4
    if ([machineId isEqualToString:@"iPad4,1"]) return 264; // iPad Air
    if ([machineId isEqualToString:@"iPad4,2"]) return 264; // iPad Air
    if ([machineId isEqualToString:@"iPad4,3"]) return 264; // iPad Air (China)
    if ([machineId isEqualToString:@"iPad5,3"]) return 264; // iPad Air 2
    if ([machineId isEqualToString:@"iPad5,4"]) return 264; // iPad Air 2
    if ([machineId isEqualToString:@"iPad6,11"]) return 264; // iPad 9.7" 5th Gen (Wi-Fi Only)
    if ([machineId isEqualToString:@"iPad6,12"]) return 264; // iPad 9.7" 5th Gen (Wi-Fi/Cellular)
    if ([machineId isEqualToString:@"iPad7,5"]) return 264; // iPad 9.7" 5th Gen (Wi-Fi Only)
    if ([machineId isEqualToString:@"iPad7,6"]) return 264; // iPad 9.7" 5th Gen (Wi-Fi/Cellular)
    if ([machineId isEqualToString:@"iPad11,3"]) return 264; // iPad 9.7" 5th Gen (Wi-Fi Only)
    if ([machineId isEqualToString:@"iPad11,4"]) return 264; // iPad 9.7" 5th Gen (Wi-Fi/Cellular)

    // iPad Minis

    if ([machineId isEqualToString:@"iPad2,5"]) return 163; // ipad mini
    if ([machineId isEqualToString:@"iPad2,6"]) return 163; // ipad mini
    if ([machineId isEqualToString:@"iPad2,7"]) return 163; // ipad mini
    if ([machineId isEqualToString:@"iPad4,4"]) return 326; // ipad mini retina
    if ([machineId isEqualToString:@"iPad4,5"]) return 326; // ipad mini retina
    if ([machineId isEqualToString:@"iPad4,6"]) return 326; // ipad mini retina
    if ([machineId isEqualToString:@"iPad4,7"]) return 326; // iPad Mini 3
    if ([machineId isEqualToString:@"iPad4,8"]) return 326; // iPad Mini 3
    if ([machineId isEqualToString:@"iPad4,9"]) return 326; // iPad Mini 3
    if ([machineId isEqualToString:@"iPad5,1"]) return 326; // iPad Mini 4 (WiFi)
    if ([machineId isEqualToString:@"iPad5,2"]) return 326; // iPad Mini 4 (LTE)
    if ([machineId isEqualToString:@"iPad11,1"]) return 326; // iPad Mini 5 (WiFi)
    if ([machineId isEqualToString:@"iPad11,2"]) return 326; // iPad Mini 5 (LTE)

    // iPad Pro

    if ([machineId isEqualToString:@"iPad6,7"]) return 264; // iPad Pro 12.9in
    if ([machineId isEqualToString:@"iPad6,8"]) return 264; // iPad Pro 12.9in
    if ([machineId isEqualToString:@"iPad6,3"]) return 264; // iPad Pro 9.7in
    if ([machineId isEqualToString:@"iPad6,4"]) return 264; // iPad Pro 9.7in
    if ([machineId isEqualToString:@"iPad7,1"]) return 264; // iPad Pro 2 12.9in
    if ([machineId isEqualToString:@"iPad7,2"]) return 264; // iPad Pro 2 12.9in
    if ([machineId isEqualToString:@"iPad7,3"]) return 264; // iPad Pro 2 9.7in
    if ([machineId isEqualToString:@"iPad7,4"]) return 264; // iPad Pro 2 9.7in
    if ([machineId isEqualToString:@"iPad8,5"]) return 264; // iPad Pro 3 12.9in
    if ([machineId isEqualToString:@"iPad8,6"]) return 264; // iPad Pro 3 12.9in
    if ([machineId isEqualToString:@"iPad8,7"]) return 264; // iPad Pro 3 12.9in
    if ([machineId isEqualToString:@"iPad8,1"]) return 264; // iPad Pro 3 12.9in
    if ([machineId isEqualToString:@"iPad8,2"]) return 264; // iPad Pro 3 12.9in
    if ([machineId isEqualToString:@"iPad7,3"]) return 264; // iPad Pro 2 9.7in

    //iPhone

    if ([machineId isEqualToString:@"iPhone1,1"]) return 163; // iPhone

    if ([machineId isEqualToString:@"iPhone1,2"]) return 163; // iPhone 3G
    if ([machineId isEqualToString:@"iPhone2,1"]) return 163; // iPhone 3GS
    if ([machineId isEqualToString:@"iPhone3,1"]) return 326; // iPhone 4
    if ([machineId isEqualToString:@"iPhone3,2"]) return 326; // iPhone 4
    if ([machineId isEqualToString:@"iPhone3,3"]) return 326; // iPhone 4
    if ([machineId isEqualToString:@"iPhone4,1"]) return 326; // iPhone 4S
    if ([machineId isEqualToString:@"iPhone5,1"]) return 326; // iPhone 5
    if ([machineId isEqualToString:@"iPhone5,2"]) return 326; // iPhone 5
    if ([machineId isEqualToString:@"iPhone5,3"]) return 326; // iPhone 5C
    if ([machineId isEqualToString:@"iPhone5,4"]) return 326; // iPhone 5C
    if ([machineId isEqualToString:@"iPhone6,1"]) return 326; // iPhone 5S
    if ([machineId isEqualToString:@"iPhone6,2"]) return 326; // iPhone 5S
    if ([machineId isEqualToString:@"iPhone7,2"]) return 326; // iPhone 6
    if ([machineId isEqualToString:@"iPhone7,1"]) return 401; // iPhone 6 Plus
    if ([machineId isEqualToString:@"iPhone8,1"]) return 326; // iPhone 6S
    if ([machineId isEqualToString:@"iPhone8,2"]) return 401; // iPhone 6S Plus
    if ([machineId isEqualToString:@"iPhone8,4"]) return 326; // iPhone SE
    if ([machineId isEqualToString:@"iPhone9,1"]) return 326; // iPhone 7
    if ([machineId isEqualToString:@"iPhone9,3"]) return 326; // iPhone 7
    if ([machineId isEqualToString:@"iPhone9,2"]) return 401; // iPhone 7 Plus
    if ([machineId isEqualToString:@"iPhone9,4"]) return 401; // iPhone 7 Plus
    if ([machineId isEqualToString:@"iPhone10,3"]) return 458; // iPhone X
    if ([machineId isEqualToString:@"iPhone10,6"]) return 458; // iPhone X
    if ([machineId isEqualToString:@"iPhone11,2"]) return 458; // iPhone XS
    if ([machineId isEqualToString:@"iPhone11,4"]) return 458; // iPhone XS Max
    if ([machineId isEqualToString:@"iPhone11,6"]) return 458; // iPhone XS Max
    if ([machineId isEqualToString:@"iPhone10,1"]) return 326; // iPhone 8
    if ([machineId isEqualToString:@"iPhone10,4"]) return 326; // iPhone 8
    if ([machineId isEqualToString:@"iPhone10,2"]) return 401; // iPhone 8 Plus
    if ([machineId isEqualToString:@"iPhone10,5"]) return 401; // iPhone 8 Plus
    if ([machineId isEqualToString:@"iPhone11,8"]) return 326; // iPhone XR
    if ([machineId isEqualToString:@"iPhone12,1"]) return 326; // iPhone 11
    if ([machineId isEqualToString:@"iPhone12,3"]) return 458; // iPhone 11 Pro
    if ([machineId isEqualToString:@"iPhone12,5"]) return 458; // iPhone 11 Pro Max

    // iPod

    if ([machineId isEqualToString:@"iPod1,1"]) return 163; // iPod Touch
    if ([machineId isEqualToString:@"iPod2,1"]) return 163; // iPod Touch
    if ([machineId isEqualToString:@"iPod3,1"]) return 163; // iPod Touch
    if ([machineId isEqualToString:@"iPod4,1"]) return 326; // iPod Touch
    if ([machineId isEqualToString:@"iPod5,1"]) return 326; // iPod Touch
    if ([machineId isEqualToString:@"iPod7,1"]) return 326; // iPod Touch
    if ([machineId isEqualToString:@"iPod9,1"]) return 326; // iPod Touch

    // can't find the device, pick something sane
    return 264;
}


@end
