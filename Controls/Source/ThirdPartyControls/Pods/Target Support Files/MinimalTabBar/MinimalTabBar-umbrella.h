#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "JDMinimalTabBar.h"
#import "JDMinimalTabBarButton.h"
#import "JDMinimalTabBarController.h"
#import "JDViewHitTestOverride.h"

FOUNDATION_EXPORT double MinimalTabBarVersionNumber;
FOUNDATION_EXPORT const unsigned char MinimalTabBarVersionString[];

