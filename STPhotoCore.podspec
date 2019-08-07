Pod::Spec.new do |s|
 s.name = 'STPhotoCore'
 s.version = '0.0.7'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Common code for STPhotoMap, STPhotoDetails frameworks for iOS'
 s.homepage = 'https://streetography.com'
 s.social_media_url = 'https://streetography.com'
 s.authors = { "Streetography" => "info@streetography.com" }
 s.source = { :git => "https://github.com/mikelanza/st-photo-core-ios.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "11.0" }
 s.requires_arc = true
 s.swift_versions = ['5.0']

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.ios.source_files  = "Sources/**/*.swift"
     ss.ios.frameworks  = "Foundation", "UIKit"
 end
end
