#import "BEMLaunchNative.h"

@implementation BEMLaunchNative

- (void)launch:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    NSString* controllerName = [[command arguments] objectAtIndex:0];

    @try {
        UIWindow* keyWindow = [[UIApplication sharedApplication] keyWindow];
        if (keyWindow == NULL) {
            keyWindow = [[UIApplication sharedApplication] windows][0];
        }
        UIViewController* toStartView = [[UIViewController alloc] initWithNibName:controllerName bundle:nil];
        keyWindow.rootViewController = toStartView;
        
        UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
        keyWindow.rootViewController = navController;
        navController.delegate = self;
        [navController pushViewController:toStartView animated:true];
        NSString* msg = [NSString stringWithFormat: @"Launched controller %@", controllerName];
        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_OK
                                   messageAsString:msg];
        [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    }
    @catch (NSException* e) {
        NSString* msg = [NSString stringWithFormat: @"While launching controller %@, error %@", controllerName, e];
        CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_ERROR
                                   messageAsString:msg];
        [self.commandDelegate sendPluginResult:result callbackId:callbackId];
    }
}

- (void)navigationController:(UINavigationController *)navigationController
       willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    NSLog(@"in willShowViewController, top view controller = %@, \
          visible view controller = %@, \
          new view controller = %@",
          navigationController.topViewController,
          navigationController.visibleViewController,
          viewController);
    if (viewController == self.viewController) {
        [navigationController setNavigationBarHidden:TRUE];
    } else {
        [navigationController setNavigationBarHidden:FALSE];
    }
}

- (void)navigationController:(UINavigationController *)navigationController
      didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    NSLog(@"in didShowViewController, top view controller = %@, \
          visible view controller = %@, \
          new view controller = %@",
          navigationController.topViewController,
          navigationController.visibleViewController,
          viewController);
}

@end
