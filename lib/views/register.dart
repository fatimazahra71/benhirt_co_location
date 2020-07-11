import 'package:co_location/services/authe.dart';
import 'package:co_location/views/auth.dart';
import 'package:co_location/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function param;
  const Register({ this.param});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _nomcontroller = TextEditingController();
  TextEditingController _prenomcontroller = TextEditingController();
  TextEditingController _telcontroller = TextEditingController();

  Future<bool> registeredUser(String email, String password, String nom, String prenom, String tel) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = nom;
      info.displayName = prenom;
      info.displayName = tel;

      user.updateProfile(info);

      return true;

    }catch(e){
      print(e);
      return false;
    }
    
  }

  //final Auth _auth = Auth();
  //final Authentication _authentication = Authentication();
  String email = '';
  String password = '';
  String nom ='';
  String prenom='';
  String tel='';

  String error ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Co-Location'),
        backgroundColor: Colors.indigo[300],
         
      ),
      body: Container(
        
        padding: EdgeInsets.fromLTRB(16.0, 35.0, 16.0, 0.0),
        child: Form(
            key: _formKey,
            child: 
              ListView(
                
                children: <Widget>[
                  (
                    //tag: 'hero',
                    //child: 
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 48.0,
                        child: Image.asset('assets/images/house.png'),
                      ),
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nomcontroller,
                    decoration: InputDecoration(
                      hintText: 'Nom',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                    ),
                    onChanged: (val){
                      setState(() { 
                        nom = val;
                      });
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Entrez votre nom';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _prenomcontroller,
                    decoration: InputDecoration(
                      hintText: 'Prénom',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                    ),
                    onChanged: (val){
                      setState(() { 
                        prenom = val;
                      });
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Entrez votre prénom';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _telcontroller,
                    decoration: InputDecoration(
                      hintText: 'Téléphone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                    ),
                    onChanged: (val){
                      setState(() { 
                        tel = val;
                      });
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Entrez votre num';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                    ),
                    onChanged: (val){
                      setState(() { 
                        email = val;
                      });
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Fill Email Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                    ),
                    onChanged: (val){
                      setState(()=>
                        password = val
                      );
                    },
                    validator: (value){
                      if(value.length < 6){
                        return 'Le nombre de caractères doit être supérieur à 6';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  // ignore: non_constant_identifier_names
                  RaisedButton(
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                    ),
                    color: Colors.indigo[300],
                    onPressed: () async{
                    
                      if (_formKey.currentState.validate()) {
                          final email = _emailcontroller.text.toString().trim();
                          final password = _passwordcontroller.text.toString().trim();
                          final nom = _nomcontroller.text.toString().trim();
                          final prenom = _prenomcontroller.text.toString().trim();
                          final tel = _telcontroller.text.toString().trim();

                          bool result =  await registeredUser(email, password, nom, prenom, tel);
                          if (result){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                              builder: (context) =>
                                  Login()
                              ),
                            );
                          }
                          else{
                            print('Erreur');
                            Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) =>
                                Login()
                            ),
                          );
                          }
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                            
                        
                      
                      }
                },
                child: Text('Submit',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                
                ],
              )
          ),
          ),
      );
  }
}