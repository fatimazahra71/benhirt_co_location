import 'package:co_location/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
/*
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(user.uid,user.nom, user.email,user.phone) : null;
  }
  //Se connecter en utilisant l'adresse email et le mot de passe

  //S'inscrire
  Future inscrire(String nom, String prenom, String tel, String email, String password) async
  {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //Se déconnecter
  Future logout() async{
    try{
      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;
    }
  }

}*/}