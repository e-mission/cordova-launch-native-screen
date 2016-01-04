#import "HWPHello.h"

@implementation BEMLaunchNative

- (void)launch:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    NSString* controllerName = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Launched controller %@", controllerName];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self success:result callbackId:callbackId];
}

@end
