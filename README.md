# CHOA Duck Tab Project

## Folder Description
ducktab : iPad Application
WebApp : Firebase Web Application

# Development method
Master branch will have original initial set up until each big milestone in development branch is completed

# Installation Guide For DuckTab Development (iPad)

Ducktab is an iPad application that patients can interact with in order to make wait time more worth.

### Prerequisites

#### Hardware
In order to develop ducktab application you would need:

* [MacBook] - Windows won't do. You would need to have Mac OS running hardware. Macbook is highly recommended.
* [iPad] - The application will run on primarily iPad Application. You would need to have iPad to test and deploy camera functionality.

#### Software

Ductab requires [Xcode](https://developer.apple.com/xcode/downloads/) v8.0+ to run.

Ducktab uses [CocoaPod](https://cocoapods.org/) which is a dependency manager for Swift and Objective-C Cocoa projects.

### Installation Guide

Clone the git repository available here on github.
```sh
$ git clone https://github.com/ckjoon/cs4803.git
$ git fetch all
$ git checkout development-iPad
```

#### Install Xcode
1. open appstore and search for  [Xcode](https://developer.apple.com/xcode/downloads)
2. Click install

#### Installing CocoaPod
open Terminal and type
```sh
$ sudo gem install cocoapods
```

Please watch this video if you encounter any problem installing cocoapod
[![ScreenShot](http://img.youtube.com/vi/iEAjvNRdZa0/0.jpg)](https://www.youtube.com/watch?v=iEAjvNRdZa0&spfreload=10)

#### Install Pod Dependency
open terminal and cd into the directory and open the application
```sh
$ cd ducktab
$ Pod install
$ open ducktab.xcworkspace/
```


### Application
1. Xcode will ask you to convert to the latest Swift. The application is developed with Swift 2.3 Convert at your own risk
![ScreenShot](Screenshots/convert.jpeg)
2. Go to preference
![ScreenShot](Screenshots/preference.jpeg)
3. Add your apple id for yo
![ScreenShot](Screenshots/appleid.jpeg)
4. Navigate to the set up page
![ScreenShot](Screenshots/screen.jpeg)
5. Add your account to the sign in
![ScreenShot](Screenshots/signin.jpeg)


### Running the Application
Click the run icon at the top to deploy your application
![ScreenShot](Screenshots/run.jpeg)

### References for iOS developers Regarding Firebase

The core part of this application relies heavily on interacting with Firebase Realtime Database
References regarding these material is available here:

*[Firebase iOS Realtime Database Guides] (https://firebase.google.com/docs/database)
*[Firebase iOS API Reference Documentation] (https://firebase.google.com/docs/reference/ios/firebasecore/api/reference/Classes)

# Installation Guide For DuckTab Development (Web)

### Prerequisites

#### Software

Ducktab requires a Firebase account
Ducktab reqiures AngularJS  

### Technologies

Angular JS
HTML
CSS

### Installation Guide

Clone the git repository available here on github.
```sh
$ git clone https://github.com/ckjoon/cs4803.git
```

#### Install AngularJS

https://docs.angularjs.org/misc/started

#### Install Firebase Dependency
open terminal and cd into the directory and open the application
```sh
$ cd ducktab/WebApp
$ npm install -g firebase-tools
```

### Running the Application
modify the configuration in WebApp/js/app.js as appropriate
open terminal and cd into the directory and open the application
```sh
$ cd ducktab/WebApp
$ firebase serve
```

### Deploying changes
open terminal and cd into the directory and open the application
```sh
$ cd ducktab/WebApp
$ firebase deploy
```
### References for developers regarding Firebase and AngularFire

*[Firebase Database Start Guide] (https://firebase.google.com/docs/database/admin/start )
*[Firebase Angular API Reference Documentation] (https://www.firebase.com/docs/web/libraries/angular/api.html)
