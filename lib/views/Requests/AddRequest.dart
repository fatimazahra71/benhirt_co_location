import 'package:co_location/Models/Request.dart';
import 'package:co_location/Models/User.dart';
import 'package:co_location/Service/DatabaseService.dart';
import 'package:co_location/views/Requests/MyRequests.dart';
import 'package:co_location/views/Requests/Requests.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRequest extends StatefulWidget {

  @override
  _AddRequestState createState() => _AddRequestState();
}
class _AddRequestState extends State<AddRequest>  {

  final DatabaseService _databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String comment = '';
  double buget;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text('Co-Location'),
          
          backgroundColor: Colors.indigo[300],
          elevation: 0.0,
         
        ),
        body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Budget maximum ',
                ),
                validator: (val) => val.isEmpty ? 'Entrez le budget maximum' : null,
                onChanged: (val) {
                  setState(() => buget = double.parse(val));
                },
              ),
              TextFormField(
                
                decoration: const InputDecoration(
                  labelText: 'Préférences',
                ),
                validator: (val) => val.length < 5 ? 'Dites nous plus de vos préférences' : null,
                onChanged: (val) {
                  setState(() => comment = val);
                },
              ),
              RaisedButton(
                color: Colors.indigo[300],
                child: Text(
                  'Confirmer',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    
                    await _databaseService.updateUserRequest( new Request('','',buget, comment ,null,null,null));
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MyRequests()));
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}