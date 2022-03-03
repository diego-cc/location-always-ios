#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint location_always_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'location_always_ios'
  s.version          = '0.0.1'
  s.summary          = 'Request location permission "Always" on iOS'
  s.description      = <<-DESC
This plugin requests the location permission "Always" on iOS and retrieves this permission's status.
                       DESC
  s.homepage         = 'https://github.com/diego-cc/location-always-ios'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Diego C.' => 'diego.cc.github@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.5.3'
end
