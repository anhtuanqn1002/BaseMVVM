# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'BaseMVVM' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # The Swift code generator for your assets, storyboards, Localizable.strings, … — Get rid of all String-based APIs!
  pod 'SwiftGen', '~> 6.0'
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 11.0
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      end
    end
  end
end
