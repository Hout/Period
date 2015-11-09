#
# Be sure to run `pod lib lint Period.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Period"
  s.version          = "0.1.0"
  s.summary          = "The `Period` class represents a period of time after an NSDate object."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
The `Period` class represents a period of time after an NSDate object.
It is in absolute time so it has no references to calendrical properties.
Various operations are implemented e.g.:
- check whether an NSDate instance lies within a Period instance.
- check whether an Period instance lies within a Period instance.
- check whether an Period instance overlaps a Period instance.
- check whether an Period instance is earlier/later than a Period instance without overlap (< or > operators).
- check whether an Period instance is earlier/later than or overlaps than a Period instance (<= or >= operators).
- implements Equatable & Comparable protocols.
                       DESC

  s.homepage         = "https://github.com/Hout/Period"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Hout" => "Hout@users.noreply.github.com" }
  s.source           = { :git => "https://github.com/Hout/Period.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target   = '9.0'
  s.osx.deployment_target   = '10.10'
  s.tvos.deployment_target  = '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
#s.resource_bundles = {
#   'Period' => ['Pod/Assets/*.png']
# }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
