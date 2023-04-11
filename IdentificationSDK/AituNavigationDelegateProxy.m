#import <WebKit/WKNavigationDelegate.h>
#import "AituNavigationDelegateProxy.h"
#import "IdentificationViewController.h"

@interface AituNavigationDelegateProxy ()

@property (nonatomic) id<WKNavigationDelegate> original;

@end

@implementation AituNavigationDelegateProxy

- (instancetype)initWithOriginal:(id<WKNavigationDelegate>)original {
    self = [super init];
    self.original = original;
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [super respondsToSelector:aSelector] ||
    [self.original respondsToSelector:aSelector] ||
    [self.supplementary respondsToSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL aSelector = [anInvocation selector];
    if ([self.supplementary respondsToSelector:aSelector]) {
        [anInvocation invokeWithTarget:self.supplementary];
    }
    if ([self.original respondsToSelector:aSelector]) {
        [anInvocation invokeWithTarget:self.original];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    __block WKNavigationResponsePolicy decision = WKNavigationResponsePolicyAllow;

    if ([self.original respondsToSelector:@selector(webView:decidePolicyForNavigationAction:decisionHandler:)]) {
        decision = WKNavigationActionPolicyCancel;
        [self.original webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:^(WKNavigationActionPolicy policy) {
            decision |= policy;
        }];
    }
    if ([self.supplementary respondsToSelector:@selector(webView:decidePolicyForNavigationAction:decisionHandler:)]) {
        [self.supplementary webView:webView decidePolicyForNavigationAction:navigationAction decisionHandler:^(WKNavigationActionPolicy policy) {
            decision &= policy;
        }];
    }

    decisionHandler(decision);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    if ([self.original respondsToSelector:@selector(webView:didCommitNavigation:)]) {
        [self.original webView:webView didCommitNavigation:navigation];
    }
    if ([self.supplementary respondsToSelector:@selector(webView:didCommitNavigation:)]) {
        [self.supplementary webView:webView didCommitNavigation:navigation];
    }
}

@end
