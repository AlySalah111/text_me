import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:text_me/pages/home_page.dart';

class AuthServices {

// instance of auth
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore firestore = FirebaseFirestore.instance;

// get current user
User? getCurrentUser() {
  return _auth.currentUser;
} 

// sign in method
Future<UserCredential>signInWithEmailAndPassword(String email,password,BuildContext context)async{
try{

UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

     // save user info in a seperate doc 
firestore.collection('Users').doc(userCredential.user!.uid).set({
  'uid':userCredential.user!.uid,
  'email':email,
}
);
// if user is not null, navigate to home page
 if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomePage()),
        );
      }



return userCredential;
}on FirebaseAuthException catch(e){
throw Exception(e.code);
}



}

// sign up method
Future<UserCredential>signUpWithEmailAndPassword(String email,password,BuildContext context)async{
try{
  // create user 
  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  // save user info in a seperate doc 
firestore.collection('Users').doc(userCredential.user!.uid).set({
  'uid':userCredential.user!.uid,
  'email':email,
}
);

    return userCredential;
}on FirebaseAuthException catch(e){
  throw Exception(e.code);
}

}

//sign out method
Future<void>signOut() async{
  return await _auth.signOut();
  
}


}
