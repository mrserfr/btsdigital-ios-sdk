Pod::Spec.new do |s|
  s.name                = 'IdentificationSDK'
  s.version             = '2.1.0'
  s.summary             = 'Identification SDK'
  s.description         = <<-DESC
Idetification SDK pod
                       DESC
  s.homepage            = 'https://digital-id.kz'
  s.license             = 'MIT'
  s.author              = { 'DigitalID' => 'sergey.frolov@btsdigital.kz' }
  s.source              = { :git => 'https://github.com/btsdigital/identification-sdk.git', :tag => "v#{s.version}" }
  s.source_files        = 'IdentificationSDK/**/*.{h,m,swift}'
  s.dependency          'Cordova'
  s.dependency          'DigitalIDZoomAuthenticationCordovaPlugin', '~> 0.8.0'
  s.ios.deployment_target = '11.0'
  s.swift_version         = '5.0'
  s.user_target_xcconfig  = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig   = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
