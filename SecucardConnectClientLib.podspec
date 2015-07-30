#
# Be sure to run `pod lib lint SecucardConnectClientLib.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SecucardConnectClientLib'
  s.version          = '0.2.0'
  s.summary          = 'Library for easy and standardized communication to the secucard infrastructure'
  s.description      = <<-DESC
                       This Library is the base for communicating with the secucard server infrastructure. It covers the full communication bandwidth
                       DESC
  s.homepage         = 'https://github.com/secucard/secucard-connect-objc-client-lib'
  # s.screenshots    = 'www.example.com/screenshots_1", "www.example.com/screenshots_2'
  s.license          = 'GPL'
  s.author           = { 'Jörn Schmidt' => 'schmidt@devid.net' }
  s.source           = { :git => 'https://github.com/secucard/secucard-connect-objc-client-lib.git', :tag => '0.2.0'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SecucardConnectClientLib' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'

  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'Mantle', '~> 2.0'
  s.dependency 'CocoaAsyncSocket', '~> 7.4'

end