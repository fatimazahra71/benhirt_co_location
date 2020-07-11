import 'package:co_location/services/authe.dart';
import 'package:co_location/views/home.dart';
import 'package:co_location/views/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:co_location/views/auth.dart';

class Login extends StatefulWidget {
  final Function param;
  const Login({ this.param});
  @override
  _LoginState createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  Future<FirebaseUser> login(String email, String password) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    return user;
    }catch(e){
      print(e);
      return null;
    }
  }
  
  String email = '';
  String password = '';
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
                    height: 20,
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
                      setState(() { 
                        password = val;
                      });
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Fill Password Input';
                      }
                    },
                  ),
                  SizedBox(
                    height: 25,
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

                         FirebaseUser user = await login(email, password);

                         if(user!=null){
                           Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) =>
                                Home()
                            ),
                          );
                         }else{
                           print('Erreur *******************');
                           Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) =>
                                Register()
                            ),
                          );
                         }


                          
                      }
                    },
                child: Text('Se connecter',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                
                RaisedButton(
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                    ),
                    color: Colors.indigo[300],
                    onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              Register()
                        ),
                      );
                    },
                    child: Text('S\'inscrire',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  )
                ],
              )
          ),
          ),
      );
  }
  }