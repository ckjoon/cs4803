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



