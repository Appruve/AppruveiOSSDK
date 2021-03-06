# rubocop:disable all
#
#  Be sure to run `pod spec lint AppruveiOSSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = 'AppruveiOSSDK'
  spec.version      = '0.1.0'
  spec.summary      = 'A Swift client for the Appruve API and a collection of UI elements to capture document photos and take Selfie'

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description = <<-DESC
  This library aims to help mobile apps developers integrating with the Appruve API\nby providing a Swift wrapper to the API and a collection of UI screens and elements to capture\nphotos of documents and faces for further facial recognition.
  DESC

  spec.homepage = 'https://github.com/Appruve/AppruveiOSSDK'

  spec.license = { type: 'Copyright',
                   text: 'Copyright 2022 Inclusive Innovations, Inc. All Rights Reserved.\n' }

  spec.author = { 'Laud Bruce-Tagoe' => 'laud@inclusiveinnovations.co' }

  spec.platform     = :ios, '11.0'

  spec.swift_version = '5.3'

  spec.source       = { http: 'https://github.com/Appruve/AppruveiOSSDK/blob/main/releases/download/0.1.0/AppruveiOSSDK.xcframework.zip?raw=true' }

  spec.vendored_frameworks = 'AppruveiOSSDK.xcframework'

  spec.dependency 'RxSwift', '~> 6.2.0'
  spec.dependency 'RxCocoa', '~> 6.2.0'
end
