# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'


# ignore all warnings from all pods
inhibit_all_warnings!

workspace 'Envitech.xcworkspace'

target 'Envitech' do
 project 'Envitech.xcodeproj'
 use_frameworks!
    # Pods for roomme
    pod 'DropDown', '2.3.2'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'dwarf'
            if config.name != 'Debug'
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
                else
                config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
            end
        end
    end
end


