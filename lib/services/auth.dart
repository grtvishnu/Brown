import 'package:airweather/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //Sign in Anonymus
Future signInAnon() async{
  try{
   AuthResult result = await _auth.signInAnonymously();
   FirebaseUser user = result.user;
   return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;

  }
}

  //sign in with email and password

  //register with email and password

  //sign out
}