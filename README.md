# remitter

[![CI Status](https://img.shields.io/travis/yasinkbas/remitter.svg?style=flat)](https://travis-ci.org/yasinkbas/remitter)
[![Version](https://img.shields.io/cocoapods/v/remitter.svg?style=flat)](https://cocoapods.org/pods/remitter)
[![License](https://img.shields.io/cocoapods/l/remitter.svg?style=flat)](https://cocoapods.org/pods/remitter)
[![Platform](https://img.shields.io/cocoapods/p/remitter.svg?style=flat)](https://cocoapods.org/pods/remitter)

## Example

<img src="https://media.giphy.com/media/gg8lk1v94yuqz31tav/giphy.gif" width=200/>

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 11.0+
- Xcode 10.0
- Swift 5

## Installation
### CocoaPods
remitter is available through [CocoaPods](https://cocoapods.org).

Add the following line to your Podfile:
```ruby
pod 'remitter'
```

### Manual
Just copy these [files](https://github.com/yasinkbas/remitter/tree/master/remitter/Classes) to your project

## Usage
### Initial
```swift
class ViewController: UIViewController {  
    var remitter: Remitter!

    override func viewDidLoad() {
      // initial remitter in a view without offset
      remitter = Remitter(in: view, cellImage: UIImage(named: "image")!)

      // initial remitter with enum offset
      remitter = Remitter(in: view, offsetType: .normal, cellImage: UIImage(named: "image")!)

      // initial custom remitter
      remitter = Remitter(in: view, offsetType: .normal, layerPosition: .zero, layerShape: .rectangle, cellImage: UIImage(named: "image")!, birthRate: 800, lifetime: 6, color: nil, velocity: 100, velocityRange: 400, emissionRange: 10, scale: 0.3)

    }
}
```

### Control
You can basically control with default functions
```swift
// stops remitter immediately
remitter.stop(animated: true)

// stops remitter after given seconds
remitter.stopAfter(seconds: 10, animated: true)

// resume remitter immediately
remitter.resume(animated: true)

// resume remitter after given seconds
remitter.resumeAfter(seconds: 15, animated: true)

```
Note: No need to call resume function when you initialized remitter


For more code examples on `remitter` usage see the example project.

## License

remitter is available under the MIT license. See the LICENSE file for more info.
