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
        .module('ducktab', ['firebase', 'ngRoute'])
        .controller("MyCtrl", ['$scope', '$firebaseObject', '$document', '$location', function ($scope, $firebaseObject, $document, $location) {
            var txtEmail = $document[0].getElementById('txtEmail');
            var txtPassword = $document[0].getElementById('txtPassword');
            var btnLogin = $document[0].getElementById('btnLogin');
            var btnSignup = $document[0].getElementById('btnSignup');
            var formLogin = $document[0].getElementById('loginForm');
            var datadump = $document[0].getElementById('message');
            var email = txtEmail.value;
            var pass = txtPassword.value;
            console.log(email);
            console.log(pass);

            btnLogin.addEventListener('click', e => {
                // get email and pass
                const email = txtEmail.value;
                const pass = txtPassword.value;
                const auth = firebase.auth();
                const promise = auth.signInWithEmailAndPassword(email, pass);
                promise.catch(e => console.log(e.message));

            });

            btnSignup.addEventListener('click', e => {
                const email = txtEmail.value;
                const pass = txtPassword.value;
                const auth = firebase.auth();

                const promise = auth.createUserWithEmailAndPassword(email, pass);

                promise.catch(e => console.log(e.message));

            });

            firebase.auth().onAuthStateChanged(firebaseUser => {
                if (firebaseUser) {
                    console.log(firebaseUser);
                    $location.path( "/home" );
                } else {
                    console.log("not logged in");
                }
            });
        }])
        .controller("HomeCtrl", ['$scope', '$firebaseObject', '$document', '$location', '$q', function ($scope, $firebaseObject, $document, $location, $q) {
          var rootRef = firebase.database().ref().child("survey questions");
          $firebaseObject(rootRef).$bindTo($scope, "surveyQuestions");
          var goToQuestionDetail = function(){
            $location.path("/questionDetail");
          };
          $scope.openDetails = function(surveyQuestion){
              localStorage.setItem("questionToDetail", surveyQuestion);
              goToQuestionDetail();
          }
          var btnLogout = $document[0].getElementById('btnLogout');
          btnLogout.addEventListener('click', e => {
              firebase.auth().signOut();
              $location.path("/");
          });
        }])
        .controller("QuestionDetailCtrl", ['$scope', '$firebaseObject', '$document', '$location', function ($scope, $firebaseObject, $document, $location) {
          $scope.question = localStorage.getItem("questionToDetail");;
          var rootRef = firebase.database().ref().child("survey questions")
          $firebaseObject(rootRef).$bindTo($scope, "questionAnswers");
          $scope.backToQuestions = function(){
            $location.path('/home');
          }

        }])
        .config(function($routeProvider){
          $routeProvider
          .when("/", {
              templateUrl : "./login.html",
              controller: "MyCtrl"
          })
          .when('/home', {
            templateUrl: "./home.html",
            controller: "HomeCtrl"
          })
          .when('/questionDetail', {
            templateUrl: "./questionDetail.html",
            controller: "QuestionDetailCtrl"
          })
        });

}());
