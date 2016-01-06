#import <Cordova/CDV.h>

@interface BEMLaunchNative: CDVPlugin <UINavigationControllerDelegate>

- (void) launch:(CDVInvokedUrlCommand*)command;

@end
