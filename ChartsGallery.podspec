#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "ChartsGallery"
  s.version          = '1.1.0'
  s.summary          = "A gallery of Shinobi charts"
  s.description      = <<-DESC
                       An app demonstrating many of the chart types it's possible to create with ShinobiCharts.
                       DESC
  s.homepage         = "https://www.shinobicontrols.com"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Alison Clarke" => "aclarke@shinobicontrols.com" }
  s.source           = { :git => "https://github.com/ShinobiControls/play-charts-gallery.git",
                         :tag => s.version.to_s,
                         :submodules => true
                       }
  s.social_media_url = 'https://twitter.com/shinobicontrols'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'ChartsGallery/ChartsGallery/**/*.{h,m}'
  s.dependency 'ShinobiPlayChartsUtils'
  s.resources = ['ChartsGallery/**/ChartsGallery*data.plist', 'ChartsGallery/**/*.storyboard', 'ChartsGallery/**/*.xib', 'ChartsGallery/**/*.xcassets']
  s.frameworks = 'QuartzCore', 'ShinobiCharts', 'OpenGLES', 'CoreText'
  s.libraries = 'c++'
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(DEVELOPER_FRAMEWORKS_DIR)" "$(PROJECT_DIR)/../"' }
end
