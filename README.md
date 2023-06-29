# Gridel

[![Swift Version](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)
[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Description

Gridel is a lightweight library created to make it easier to create pixel-perfect apps according to your designers wishes. 

## Features

- Selecting the action by which the Gridel popup opens - For now only **_shake_** is available.
- Defining rows
- Defining columns

## Requirements

- Swift 5.0+
- iOS 14.0+

## Installation



### Swift Package Manager

You can install Gridel using the Swift Package Manager. To integrate it into your Xcode project, follow these steps:

1. Open your project in Xcode.
2. Navigate to **File > Swift Packages > Add Package Dependency**.
3. Enter the repository URL: https://github.com/ArasDigitalProducts/Gridel-iOS 
4. Specify the version or branch that you want to use. - We are currently not using versions, so you have to specify the develop branch like so:
   
   ![image](https://github.com/ArasDigitalProducts/Gridel-iOS/assets/34174145/c13f5b7c-44a3-48b6-bc03-bac6ae69998e)

## Usage


### SwiftUI
You have to make sure to configure Gridel **AFTER** app's window is initiated. In SwiftUI it would looks something like this:
![image](https://github.com/ArasDigitalProducts/Gridel-iOS/assets/34174145/c9994ca0-8738-4625-8033-387e688d910c)


### UIKit
You have to make sure the app's scene is initiated. In UIKit you would configure Gridel in will connect scene function like this:
![image](https://github.com/ArasDigitalProducts/Gridel-iOS/assets/34174145/95806204-657f-44bb-8a03-61609ddd1060)

