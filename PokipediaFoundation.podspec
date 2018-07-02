#
#  Be sure to run `pod spec lint PokipediaFoundation.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name = "PokipediaFoundation"
  s.module_name = "PokipediaFoundation"
  s.version = "0.0.1"
  s.summary = "A framework with the business logic for the Pokipedia app."
  s.description  = <<-DESC
                   Core Data, networking, and other business logic for the Pokipedia app.
                   DESC
  s.homepage = "https://haoxin.li"
  s.license = "BSD License 2.0"
  s.author = "Haoxin Li"
  s.ios.deployment_target = "11.0"
  s.source = { :git => "https://github.com/54lihaoxin/pokipedia_foundation.git", :tag => "#{s.version}" }
  s.source_files = "PokipediaFoundation", "PokipediaFoundation/**/*.{h,m,swift}"
  s.exclude_files = "PokipediaFoundationTests"
  s.frameworks = "CoreData"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
end
