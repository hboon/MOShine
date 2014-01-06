//
//  MOUIDeviceAdditions.m
//  Licensed under the terms of the BSD License, as specified below.
//
//  Created by Hwee-Boon Yar on Dec/12/2013.
//
/*
 Copyright 2013 Yar Hwee Boon. All rights reserved.
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of MotionObj nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDevice (MOUIDeviceAdditions)

//Courtesy of https://github.com/InderKumarRathore/UIDevice-Hardware/blob/master/UIDevice%2BHardware.m
- (NSString*)moHardwareDescription {
	NSString *hardware = [self moHardwareString];
	if ([hardware isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
	if ([hardware isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
	if ([hardware isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
	if ([hardware isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (GSM)";
	if ([hardware isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (GSM Rev. A)";
	if ([hardware isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (CDMA)";
	if ([hardware isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
	if ([hardware isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (GSM)";
	if ([hardware isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (Global)";
	if ([hardware isEqualToString:@"iPhone5,3"]) return @"iPhone 5C (GSM)";
	if ([hardware isEqualToString:@"iPhone5,4"]) return @"iPhone 5C (Global)";
	if ([hardware isEqualToString:@"iPhone6,1"]) return @"iPhone 5S (GSM)";
	if ([hardware isEqualToString:@"iPhone6,2"]) return @"iPhone 5S (Global)";

	if ([hardware isEqualToString:@"iPod1,1"]) return @"iPod Touch (1 Gen)";
	if ([hardware isEqualToString:@"iPod2,1"]) return @"iPod Touch (2 Gen)";
	if ([hardware isEqualToString:@"iPod3,1"]) return @"iPod Touch (3 Gen)";
	if ([hardware isEqualToString:@"iPod4,1"]) return @"iPod Touch (4 Gen)";
	if ([hardware isEqualToString:@"iPod5,1"]) return @"iPod Touch (5 Gen)";

	if ([hardware isEqualToString:@"iPad1,1"]) return @"iPad (WiFi)";
	if ([hardware isEqualToString:@"iPad1,2"]) return @"iPad 3G";
	if ([hardware isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
	if ([hardware isEqualToString:@"iPad2,2"]) return @"iPad 2 (GSM)";
	if ([hardware isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
	if ([hardware isEqualToString:@"iPad2,4"]) return @"iPad 2 (WiFi Rev. A)";
	if ([hardware isEqualToString:@"iPad2,5"]) return @"iPad Mini (WiFi)";
	if ([hardware isEqualToString:@"iPad2,6"]) return @"iPad Mini (GSM)";
	if ([hardware isEqualToString:@"iPad2,7"]) return @"iPad Mini (CDMA)";
	if ([hardware isEqualToString:@"iPad3,1"]) return @"iPad 3 (WiFi)";
	if ([hardware isEqualToString:@"iPad3,2"]) return @"iPad 3 (CDMA)";
	if ([hardware isEqualToString:@"iPad3,3"]) return @"iPad 3 (Global)";
	if ([hardware isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
	if ([hardware isEqualToString:@"iPad3,5"]) return @"iPad 4 (CDMA)";
	if ([hardware isEqualToString:@"iPad3,6"]) return @"iPad 4 (Global)";
	if ([hardware isEqualToString:@"iPad4,1"]) return @"iPad Air (WiFi)";
	if ([hardware isEqualToString:@"iPad4,2"]) return @"iPad Air (WiFi+GSM)";
	if ([hardware isEqualToString:@"iPad4,3"]) return @"iPad Air (WiFi+CDMA)";
	if ([hardware isEqualToString:@"iPad4,4"]) return @"iPad Mini Retina (WiFi)";
	if ([hardware isEqualToString:@"iPad4,5"]) return @"iPad Mini Retina (WiFi+CDMA)";
	if ([hardware isEqualToString:@"i386"]) return @"Simulator";
	if ([hardware isEqualToString:@"x86_64"]) return @"Simulator";

	NSLog(@"This is a device which is not listed in this category. Please visit https://github.com/inderkumarrathore/UIDevice-Hardware and add a comment there.");
	NSLog(@"Your device hardware string is: %@", hardware);
	if ([hardware hasPrefix:@"iPhone"]) return @"iPhone";
	if ([hardware hasPrefix:@"iPod"]) return @"iPod";
	if ([hardware hasPrefix:@"iPad"]) return @"iPad";

	return @"Unknown";
}


//Courtesy of https://github.com/InderKumarRathore/UIDevice-Hardware/blob/master/UIDevice%2BHardware.m
- (NSString*)moHardwareString {
	size_t size = 100;
	char *hw_machine = malloc(size);
	int name[] = {CTL_HW,HW_MACHINE};
	sysctl(name, 2, hw_machine, &size, NULL, 0);
	NSString *hardware = [NSString stringWithUTF8String:hw_machine];
	free(hw_machine);
	return hardware;
}

@end
