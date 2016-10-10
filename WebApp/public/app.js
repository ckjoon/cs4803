(function () {
    var config = {
        apiKey: "AIzaSyB-08qoWrQJ-qL3xzcd2WRxsElgimGu_6Y",
        authDomain: "patient-dashboard.firebaseapp.com",
        databaseURL: "https://patient-dashboard.firebaseio.com",
        storageBucket: "patient-dashboard.appspot.com",
        messagingSenderId: "16037256685"
    };

    firebase.initializeApp(config);

    angular
        .module('ducktab', ['firebase'])
        .controller("MyCtrl", function ($firebaseObject) {
            const rootRef = firebase.database().ref().child("survey questions");
            const ref = rootRef.child("question1");
            this.object = $firebaseObject(ref);
        });

}());