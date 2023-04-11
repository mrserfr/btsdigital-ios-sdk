//
//  IdentificationNavigationController.m
//  IdentificationSDK
//
//  Created by BTSD on 28.12.2020.
//

#import "IdentificationNavigationController.h"
#import "IdentificationViewController.h"

@interface IdentificationNavigationController ()

@end

@implementation IdentificationNavigationController

- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)flag
                   completion:(void (^)(void))completion {
    
    IdentificationViewController *identificationViewController;
    for (UIViewController *vc in self.viewControllers) {
        if ([vc isKindOfClass:[IdentificationViewController class]]) {
            identificationViewController = (IdentificationViewController *)vc;
            break;
        }
    }
    
    if (identificationViewController != nil) {
        [identificationViewController setUIDocumentMenuViewControllerSoureViewsIfNeeded:viewControllerToPresent];
    }
    
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
