# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

workspace 'TestUnicoSDK.xcworkspace'
project 'TestUnicoSDK.xcodeproj'


def unicocheck
    pod 'unicocheck-ios', '2.2.1'
end


target 'TestUnicoSDK' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  unicocheck
  
  target 'TestUnicoSDKTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'TestUnicoSDKUITests' do
    # Pods for testing
  end
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if ["CryptoSwift", "JOSESwift"].include? target.name
        target.build_configurations.each do |config|
          config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
      end
    end
  end
end

target 'UnicoModule' do
  project "UnicoModule/UnicoModule"
  unicocheck
  
  target 'UnicoModuleTests' do
    inherit! :complete
  end
end
