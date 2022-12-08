Pod::Spec.new do |s|
  s.name = 'ParadigmUtilities'
  s.version = '1.1.13'
  s.summary = 'Shared library between the Server and Client.'
  s.homepage = 'https://github.com/RandomHashTags/paradigm-utilities'
  s.license = { :type => 'CC0 1.0 Universal', :file => 'LICENSE.txt' }
  s.authors = { 'Evan Anderson' => 'imrandomhashtags@gmail.com' }
  s.social_media_url = 'https://twitter.com/irandomhashtags'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.source = { :git => 'https://github.com/RandomHashTags/paradigm-utilities.git', :tag => s.version.to_s }
  s.swift_versions = ['5.6', '5.7']
  s.cocoapods_version = '>= 1.5.0'
  s.source_files = 'Sources/**/*'
  s.dependency 'SwiftSovereignStates', '~> 1.1.5'
  s.dependency 'ZippyJSON', '~> 1.2.5'
  s.dependency 'GEOSwift', '~> 9.0.0'
end
