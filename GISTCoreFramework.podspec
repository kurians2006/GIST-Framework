321#
#  Be sure to run `pod spec lint GISTCoreFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "GISTCoreFramework"
  s.version      = "2.1.3"
  s.summary      = "GISTCoreFramework is bottom architecture layour of iOS apps."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                   GISTCoreFramework is a bottom layer architecture of all iOS apps. it has all basic features and reusable classes that an iOS app may require. We made it open source to be used by others.
                   DESC

  s.homepage     = "https://github.com/cubixlabs/GIST-Framework"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  # s.license      = "MIT (example)"
  s.license      = { :type => "GNU AGPLv3", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Social Cubix Inc." => "" }
  # Or just: s.author    = "Social Cubix Inc."
  # s.authors            = { "Social Cubix Inc." => "" }
  # s.social_media_url   = "http://twitter.com/Cubix Labs Inc."

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
    s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/cubixlabs/GIST-Framework.git", :tag => "2.1.3" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  #s.source_files  = "GISTFramework", "GISTFramework/Classes/**/*.{swift}"
  #s.exclude_files = "GISTFramework/Exclude"

  #s.public_header_files = "GISTFramework/**/*.h"

  s.subspec 'GISTCore' do |sp|
    sp.source_files = 'GISTFramework/Classes/GISTCore/**/*.{swift}'

    sp.dependency 'PhoneNumberKit', '~> 1.2.2'
  end

  s.subspec 'BaseClasses' do |sp|
    sp.source_files = 'GISTFramework/Classes/BaseClasses/**/*.{swift}'
    sp.dependency 'GISTFramework/GISTCore'
    sp.dependency 'GISTFramework/Extentions'
    sp.dependency 'GISTFramework/SyncEngine'
  end

  s.subspec 'Controls' do |sp|
    sp.source_files = 'GISTFramework/Classes/Controls/**/*.{swift}'
    sp.dependency 'GISTFramework/GISTCore'
    sp.dependency 'GISTFramework/BaseClasses'
    sp.dependency 'GISTFramework/Extentions'
    sp.dependency 'GISTFramework/SyncEngine'
  end

  s.subspec 'Extentions' do |sp|
    sp.source_files = 'GISTFramework/Classes/Extentions/**/*.{swift}'
    sp.dependency 'GISTFramework/GISTCore'
    sp.dependency 'GISTFramework/SyncEngine'
  end

  s.subspec 'SyncEngine' do |sp|
    sp.source_files = 'GISTFramework/Classes/SyncEngine/**/*.{swift}'
    sp.dependency 'UIColor_Hex_Swift', '~> 3.0.2'
  end

  s.pod_target_xcconfig = {
    'OTHER_SWIFT_FLAGS[config=Debug]' => '-DDEBUG',
  }

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Synced\ Plists/*.plist"

  # s.preserve_paths = "Synced\ Plists"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
end