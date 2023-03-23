# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

def dependencies_pods
  # The Swift code generator for your assets, storyboards, Localizable.strings, … — Get rid of all String-based APIs!
  pod 'SwiftGen', '~> 6.0'
  pod 'SwiftLint'
  pod 'Moya', '~> 15.0'
  pod 'Moya/Combine', '~> 15.0'
  pod 'XCGLogger', '~> 7.0.1'
end

target 'BaseMVVM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  dependencies_pods
  
  target 'BaseMVVMTests' do
    inherit! :search_paths
    # Pods for testing
    
  end

#  target 'BaseMVVMUITests' do
#    # Pods for testing
#  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 13.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end
