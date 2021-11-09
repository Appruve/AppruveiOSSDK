# iOS SDK For Appruve API

The Appruve iOS SDK aims to help mobile apps developers integrating with the Appruve API by providing a Swift wrapper to the API and a collection of UI screens and elements to capture photos of documents and faces for further facial recognition.

## Adding the SDK

### Adding the SDK with CocoaPods

Coming soon...


### Manually adding the SDK

You can manually add the SDK to your project in Xcode.

1. Download the SDK => https://github.com/Appruve/AppruveiOSSDK/releases/download/0.0.1/AppruveiOSSDK.xcframework.zip
2. In Xcode, select your project in Project navigator:
3. In Finder, navigate to where you extracted the SDK.
4. Drag the `AppruveiOSSDK.xcframework` to the `Frameworks and Libraries` section under the general settings tab of your application's target. Ensure the Embed dropdown has Embed and Sign selected for the framework.
5. Set the Add Files options as follows:
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
2. Paste the following initialization code into the application: didFinishLaunchingWithOptions method.

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
  extension ViewController: AppruveVerificationCompleteDelegate {
    func onVerificationComplete(result: AppruveVerificationResult) {
        print(result)
    }

    func onVerificationFailure(error: String) {
        print(error)
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
