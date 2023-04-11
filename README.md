# IdentificationSDK
Aitu Passport and Digital ID iOS SDK

**Требования:**

- iOS 14 и выше
- Добавить `NSCameraUsageDescription` в **info.plist**
- Добавьте в проект файл `config.xml` (пример в конце документации)
- Урлы с кастомными схемами вида `custom-url-scheme://my-url` не поддерживаются

**Установка с Cocoapods:**

Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

pod ‘IdentificationSDK’, ‘2.1.0’
```

**Зависимости:**

```javascript
- Cordova iOS
- DigitalIDZoomAuthenticationCordovaPlugin
```

**Пример:**

```swift
import UIKit
import IdentificationSDK

class ViewController: UIViewController {
    
    private var identificationController: IdentificationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let options = IdentificationOptions()
        options.language = "ru"

        identificationController = IdentificationViewController(url: "https://app.gov.stage.digital-id.kz/oauth?response_type=code&client_id={client_id}&scope=ID_CARD&redirect_uri=https://www.egov.kz/digital-id-callback&state=EGOV", redirectUrl: "site.com/digital-id-callback", options: options)
        identificationController?.identificationDelegate = self
        self.present(identificationController!, animated: true, completion: nil)
    }
}

extension ViewController: IdentificationViewControllerDelegate {
    func identificationViewController(_ viewController: IdentificationViewController,
                           didTriggerRedirectUrl redirectUrl: String) {
        identificationViewController?.dismiss(animated: true, completion: nil)
        identificationViewController = nil
    }
}
```

`url` - адрес запуска DigitalID или Aitu Passport
`redirectUrl` - адрес клиента, который должен полностью или частично быть частью `redirect_uri` в параметре `url`
`options` - настройки сдк. Например можете настроить язык на котором будет запущен Digital ID или Aitu Passport.

Где,
`func identificationViewController(_ viewController: IdentificationViewController, didTriggerRedirectUrl redirectUrl: String)`
вызывается когда DigitalID или Aitu Passport переходит по переданному `redirect_uri` в параметре `url`


🍂

**DigitalID SDK** - во фреймворке `DigitalIDZoomAuthenticationCordovaPlugin` используем FaceTec (iOS SDK) от компании [FaceTec](https://www.facetec.com/)


**Пример config.xml файла**
```xml
<?xml version='1.0' encoding='utf-8'?>
<widget id="io.cordova.helloCordova" version="2.0.0" xmlns="http://www.w3.org/ns/widgets">
    <name>HelloCordova</name>
    <description>
        A sample Apache Cordova application that responds to the deviceready event.
    </description>
    <author email="dev@cordova.apache.org" href="http://cordova.io">
        Apache Cordova Team
    </author>
    <content src="https://app.gov.stage.digital-id.kz/" />
handle
    <plugin name="cordova-plugin-whitelist" spec="1" />
    <access origin="*" launch-external="no"/>
    <allow-navigation href="http://*/*" />
    <allow-navigation href="https://*/*" />
    
    <access origin="*" />
    <allow-intent href="http://*/*" />
    <allow-intent href="https://*/*" />
    <allow-intent href="tel:*" />
    <allow-intent href="sms:*" />
    <allow-intent href="mailto:*" />
    <allow-intent href="geo:*" />
    <access origin="*" />
    <allow-intent href="http://*/*" />
    <allow-intent href="https://*/*" />
    <allow-intent href="tel:*" />
    <allow-intent href="sms:*" />
    <allow-intent href="mailto:*" />
    <allow-intent href="geo:*" />
    <allow-intent href="itms:*" />
    <allow-intent href="itms-apps:*" />
    <preference name="AllowInlineMediaPlayback" value="false" />
    <preference name="BackupWebStorage" value="cloud" />
    <preference name="DisallowOverscroll" value="false" />
    <preference name="EnableViewportScale" value="false" />
    <preference name="KeyboardDisplayRequiresUserAction" value="true" />
    <preference name="MediaPlaybackRequiresUserAction" value="false" />
    <preference name="SuppressesIncrementalRendering" value="false" />
    <preference name="SuppressesLongPressGesture" value="false" />
    <preference name="Suppresses3DTouchGesture" value="false" />
    <preference name="GapBetweenPages" value="0" />
    <preference name="PageLength" value="0" />
    <preference name="PaginationBreakingMode" value="page" />
    <preference name="PaginationMode" value="unpaginated" />
    <feature name="LocalStorage">
        <param name="ios-package" value="CDVLocalStorage" />
    </feature>
    <feature name="HandleOpenUrl">
        <param name="ios-package" value="CDVHandleOpenURL" />
        <param name="onload" value="true" />
    </feature>
    <feature name="IntentAndNavigationFilter">
        <param name="ios-package" value="CDVIntentAndNavigationFilter" />
        <param name="onload" value="true" />
    </feature>
    <feature name="GestureHandler">
        <param name="ios-package" value="CDVGestureHandler" />
        <param name="onload" value="true" />
    </feature>
    <feature name="Console">
        <param name="ios-package" value="CDVLogger" />
    </feature>
    <feature name="FaceTecSDK">
          <param name="ios-package" value="FaceTecCordovaSDK" />
    </feature>
    <preference name="StatusBarOverlaysWebView" value="false" />
    <preference name="StatusBarStyle" value="default" />
    <platform name="ios">
        <preference name="WKWebViewOnly" value="true" />

        <feature name="CDVWKWebViewEngine">
            <param name="ios-package" value="CDVWKWebViewEngine" />
        </feature>

        <preference name="CordovaWebViewEngine" value="CDVWKWebViewEngine" />
    </platform>
</widget>
```

[.gitignore](..%2Fidentification-sdk%2F.gitignore)
[IdentificationSDK.podspec](..%2Fidentification-sdk%2FIdentificationSDK.podspec)
[Podfile](..%2Fidentification-sdk%2FPodfile)
[Podfile.lock](..%2Fidentification-sdk%2FPodfile.lock)
