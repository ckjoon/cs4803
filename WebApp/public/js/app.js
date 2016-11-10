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

            $scope.login = function(){
              // get email and pass
              var email = txtEmail.value;
              var pass = txtPassword.value;
              var auth = firebase.auth();
              var promise = auth.signInWithEmailAndPassword(email, pass);
              promise.catch(function(e){alert(e.message);});
              $location.path("\home")
            }

            btnSignup.addEventListener('click', e => {
                const email = txtEmail.value;
                const pass = txtPassword.value;
                const auth = firebase.auth();

                const promise = auth.createUserWithEmailAndPassword(email, pass);

                promise.catch(function(e){
                  alert(e.message);
                });

                promise.then(function(){
                  alert("User account created");
                })

            });

            firebase.auth().onAuthStateChanged(firebaseUser => {
                if (firebaseUser) {
                    console.log(firebaseUser);
                } else {
                    console.log("not logged in");
                }
            });


        }])
        .controller("HomeCtrl", ['$scope', '$firebaseObject', '$document', '$location', '$q', function ($scope, $firebaseObject, $document, $location, $q) {

          // if (firebase.auth.currentUser == undefined){
          //   firebase.auth().signOut();
          //   $location.path("/");
          // }
          var rootRefQuestions = firebase.database().ref().child("questions");
          $firebaseObject(rootRefQuestions).$bindTo($scope, "questionWithLocations");
          var rootRefCurrentLocation = firebase.database().ref().child("current_location");
          $firebaseObject(rootRefCurrentLocation).$bindTo($scope, "currentUserLocations");
          var goToQuestionDetail = function(){
            $location.path("/questionDetail");
          };

          $scope.openDetails = function(surveyQuestion){
              localStorage.setItem("questionToDetail", surveyQuestion);
              goToQuestionDetail();
          }

          $scope.logout = function(){
            firebase.auth().signOut();
            $location.path("/");
          }

          $scope.getLength = function(obj) {
            return Object.keys(obj).length;
          }

          $scope.setModifyQuestionData = function(question, location){
            $scope.originalQuestion = question;
            $scope.modifiedQuestion = question;
            $scope.questionLocation = location;
          }

          $scope.updateQuestionInFB = function(){
            var modifiedQuestion = $scope.modifiedQuestion;
            var testing = rootRefQuestions.child($scope.questionLocation);

            //TODO: Take care of the tempObject hack
            var tempObject = {
              gender: 'M',
              age: '10000',
              answer: ''
            }
            rootRefQuestions.child($scope.questionLocation).child($scope.originalQuestion).set({});
            rootRefQuestions.child($scope.questionLocation).child($scope.modifiedQuestion).set({'remove': tempObject});
          }

          $scope.setQuestionToDelete = function(question, location){
            $scope.questionToDelete = question;
            $scope.locationOfQuestionToDelete = location;
          }

          $scope.deleteQuestionFromFB = function(){
            rootRefQuestions.child($scope.locationOfQuestionToDelete).child($scope.questionToDelete).set({});
          }

          $scope.newQuestion = '';
          $scope.newQuestionLocation = '';
          $scope.addQuestionToFB = function(){

            rootRefQuestions.child($scope.questionLocation).child($scope.modifiedQuestion).set({'remove': tempObject});
          }

        }])
        .controller("QuestionDetailCtrl", ['$scope', '$firebaseObject', '$document', '$location', function ($scope, $firebaseObject, $document, $location) {
          $scope.question = localStorage.getItem("questionToDetail");;
          var rootRef = firebase.database().ref().child("questions")
          $firebaseObject(rootRef).$bindTo($scope, "questions");
          $scope.backToQuestions = function(){
            $location.path('/home');
          }
          $scope.logout = function(){
            firebase.auth().signOut();
            $location.path("/");
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
