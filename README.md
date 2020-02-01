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
To be able to use the framework in your project:
1. Install [CocoaPods](https://guides.cocoapods.org/using/getting-started.html#toc_3) on your computer:
```ruby
$ sudo gem install cocoapods
```
2. Create a [Podfile](https://guides.cocoapods.org/using/the-podfile.html) in your project directory and add the dependency:
```ruby
use_frameworks!
platform :ios, '11.0'
target '<my_app>' do
  pod 'remitter'
end
```
3. Run `pod install` in the project directory:
```ruby
$ cd <path/to/your/project/directory>
$ pod install
```
4. Open `<my_app>.xcworkspace` in Xcode and build.
5. From now on you can import and use the framework in your code:
```swift
import remitter
```

## Usage
1. Import the framework into swift file.


```swift
import remitter                            //1
class ViewController: UIViewController {  
    var remitter: Remitter!

    override func viewDidLoad() {
      remitter = Remitter(in: view, offsetType: .normal, cellImage: UIImage(named: "your_image")!)
    }
}
```

For more code examples on `remitter` usage see the example project.


## License

remitter is available under the MIT license. See the LICENSE file for more info.
