![Xcode 9.0+](https://img.shields.io/badge/Xcode-9.0%2B-blue.svg)
![iOS 9.0+](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)
![CocoaPods](https://img.shields.io/cocoapods/v/AFNetworking.svg)
[![Build Status](https://travis-ci.org/TBXark/PinterestSegment.svg?branch=master)](https://travis-ci.org/TBXark/PinterestSegment)

# Welcome to MyAlert!

Hi! MyAlert is an alertview. Shortly , show notifications in the app. It is simple to use and easy to develop.

![](gorsel.gif)


# Requirements

- iOS 9.0+
- Xcode 9.0
- Swift 4

# Installation

   ## CocoaPods
   You can use [CocoaPods](http://cocoapods.org/) to install `myAlert` by adding it to your `Podfile`:

   ```ruby
    platform :ios, '9.0'
    use_frameworks!
    pod 'myAlert'
   ```

  ## Manually
  1. Download and drop ```MyAlertController.swift``` in your project.  
  2. Congratulations!  

# Usage 

```swift
    let myAlert = MyAlertController()
     myAlert.yourView = self.view
     myAlert.bgColor = UIColor.red
     myAlert.textColor = UIColor.white
     myAlert.show(title:"For example alert view and title",subtitle:"Here is the sub title",delay:3)
```


## Release History

* 1.0
  first commit
  
