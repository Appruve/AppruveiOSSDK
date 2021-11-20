# iOS SDK For Appruve API

The [Appruve](https://www.appruve.co/) iOS SDK aims to help mobile apps developers integrating with the Appruve API by providing a Swift wrapper to the API and a collection of UI screens and elements to capture photos of documents and faces for further facial recognition.

| <img src="https://user-images.githubusercontent.com/5106229/142033123-d4c3b894-4b23-405c-b51e-97ac86b983c1.PNG" width="250"> | <img src="https://user-images.githubusercontent.com/5106229/142033152-bd8bbee2-5468-43e8-95d8-a89242460971.PNG" width="250"> | <img src="https://user-images.githubusercontent.com/5106229/142033168-65f16eaf-3732-42ca-809f-93f5ebc05761.PNG" width="250"> |
|------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|

## Adding the SDK

### Adding the SDK with CocoaPods

CocoaPods is a dependency manager that lets you add third-party frameworks and libraries to projects. For installation instructions, see [Install CocoaPods](https://guides.cocoapods.org/using/getting-started.html#toc_3).

If not already done, create a Podfile for your project as follows:

1. In Terminal, navigate to the top-level folder of your project (the one with the xcodeproj file).

<img width="268" alt="Screenshot 2021-11-09 at 7 21 12 PM" src="https://user-images.githubusercontent.com/5106229/141089214-2d798efd-3f8f-4a7b-a86f-e5f4ae4a597c.png">

2. Create a Podfile with the following command: `$ pod init`

3. Open the file in Xcode with the following command: `open -a Xcode Podfile`

The content should look as follows:

```ruby
  target 'ExampleProject' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!
  end
```

1. Add the `AppruveiOSSDK` pod to the `do` block of your Podfile

```ruby
  target 'ExampleProject' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!

    pod 'AppruveiOSSDK'
  end
```

2. Save the Podfile.

3. Run the following command in Terminal:

```
pod install
```

**Note**: If you installed a previous version of the SDK with CocoaPods, run `pod update` first to update the SDK pod on your system.

Because your project now contains a dependency managed by CocoaPods, you must open the project in Xcode by double-clicking the `.xcworkspace` file, not `.xcodeproj`.

For more information, see [Using CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html) on cocoapods.org.

### Manually adding the SDK

You can manually add the SDK to your project in Xcode.

1. Add the following pods to your projects `Podfile` then run `pod install`:

```ruby
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'SwiftyJSON', '~> 4.0'
```

2. Download the SDK => https://github.com/Appruve/AppruveiOSSDK/blob/main/releases/download/0.0.1/AppruveiOSSDK.xcframework.zip?raw=true

3. In Xcode, select your project in Project navigator:

4. In Finder, navigate to where you extracted the SDK.

5. Drag the `AppruveiOSSDK.xcframework` to the `Frameworks and Libraries` section under the general settings tab of your application's target. Ensure the Embed dropdown has Embed and Sign selected for the framework.

6. Set the Add Files options as follows:
    * Destination - select Copy items if needed
    * Added folders - select Create groups

### Update usage descriptions in Info.plist

The SDK uses the camera and photo library in iOS to allow end users to take photos.

If your app doesn't already request permissions for these features, update your Info.plist file with a usage description for `NSPhotoLibraryUsageDescription` and `NSCameraUsageDescription`.

## Initializing the SDK (Required)

1. Import the `AppruveiOSSDK` module into the AppDelegate file in your project.

```swift
  import AppruveiOSSDK
```
2. Paste the following initialization code into the application: didFinishLaunchingWithOptions method or just before you call `Appruve.buildVerificationController`.

```swift
  Appruve.initialize(
    apiKey: "YOUR_API_KEY",
    isGhanaEnabled: true,
    isNigeriaEnabled: true,
    isKenyaEnabled: true,
    primaryBrandColor: "#69298a",
    secondaryBrandColor: "#F49600",
    isDocumentCaptureRetryEnabled: true,
    isDocumentCaptureOnly: false,
    isSelfieCaptureOnly: false,
    isGhanaVoterIDEnabled: true,
    isGhanaPassportIDEnabled: true,
    isGhanaDriverLicenseIDEnabled: true,
    isGhanaSSNITIDEnabled: true,
    isNigeriaVoterIDEnabled: true,
    isNigeriaPassportIDEnabled: true,
    isNigeriaDriverLicenseIDEnabled: true,
    isNigeriaNationalIDEnabled: true,
    isKenyaNationalIDEnabled: true,
    isKenyaPassportIDEnabled: true
  )
```

## Starting the Verification UIViewController

First, import the required module.

```swift
  import AppruveiOSSDK
```

Second, implement the AppruveVerificationCompleteDelegate protocol.

```swift
  extension ViewController: AppruveVerificationDelegate {
    func onVerificationComplete(result: AppruveVerificationResult) {
        print(result)
    }

    func onVerificationFailure(error: String) {
        print(error)
    }

    func onFlowChanged(flow: String) {
        print(flow)
    }
  }
```

Third, build and present the verification controller.

```swift
  do {
      let appruveViewController = try Appruve.buildVerificationController(delegate: self)
      self.navigationController?.pushViewController(appruveViewController, animated: true)
  } catch {
      print("An error occurred: \(error)")
  }
````
