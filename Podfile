source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'mealShake' do
 pod 'Alamofire', '~> 4.5.0'
 pod 'AlamofireImage', '~> 3.3'
 pod 'Tactile', '~> 2.0'
 pod 'DynamicColor', '~> 3.1.0'
 pod 'GoogleMaps'
 pod 'GooglePlaces'
 pod 'SwiftyJSON'
 
 
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
     config.build_settings['SWIFT_VERSION'] = '3.0'
     config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
   end
 end
end
