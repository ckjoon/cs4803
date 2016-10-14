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

    const txtEmail = document.getElementById('txtEmail');
    const txtPassword = document.getElementById('txtPassword');
    const btnLogin = document.getElementById('btnLogin');
    const btnSignup = document.getElementById('btnSignup');
    const btnLogout = document.getElementById('btnLogout');
    const email = txtEmail.value;
    const pass = txtPassword.value;
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

    btnLogout.addEventListener('click', e => {
        firebase.auth().signOut();
    });

    firebase.auth().onAuthStateChanged(firebaseUser => {
        if (firebaseUser) {
            console.log(firebaseUser);
            btnLogout.classList.remove('hide');
        } else {
            console.log("not logged in");
            btnLogout.classList.add('hide');
        }
    });


}());