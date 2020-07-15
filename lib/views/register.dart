import 'package:co_location/services/authe.dart';
import 'package:co_location/views/auth.dart';
import 'package:co_location/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:co_location/services/authe.dart';

class Register extends StatefulWidget {
  final Function param;
  const Register({ this.param});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String name = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign up to CoLoc'),
        backgroundColor: Colors.indigo[300],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 35.0, 16.0, 0.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 48.0,
                child: Image.asset('assets/images/house.png'),
              ),
            ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nom et Prénom *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,

                    ),
                  ),
                ),
                validator: (val) => val.isEmpty ? 'Entrez votre nom et votre prénom' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(
                height: 20,
              ),TextFormField(
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
                validator: (val) => val.isEmpty ? 'Enter a phone' : null,
                onChanged: (val) {
                  setState(() => phone = val);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'email ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,

                    ),
                  ),
                ),
                validator: (val) => val.isEmpty ? 'Entrez une adresse email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 3,

                    ),
                  ),
                ),
                obscureText: true,
                validator: (val) =>
                val.length < 6 ? 'Entrez un mot do passe de plus de 6 caractères' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),

              SizedBox(
                height: 20,
              ),

              RaisedButton(
                  color: Colors.indigo[300],
                  child: Text(
                    'Valider',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password, name, phone);

                      if (result == null) {
                        setState(() {
                          error = 'Erreur';
                        });
                      }
                      else{Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );}
                      /**/
                    }
                  }),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}