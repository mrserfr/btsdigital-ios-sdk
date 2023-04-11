#import <Foundation/Foundation.h>
#import <WebKit/WKNavigationDelegate.h>

@protocol IdentificationNavigationDelegate;

@interface AituNavigationDelegateProxy : NSObject <WKNavigationDelegate>

@property (nonatomic, weak) id<IdentificationNavigationDelegate> supplementary;

- (instancetype)initWithOriginal:(id<WKNavigationDelegate>)original;

@end

