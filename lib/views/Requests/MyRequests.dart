import 'package:co_location/Models/Request.dart';
import 'package:co_location/Service/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:co_location/views/menu.dart';
import 'package:provider/provider.dart';
import 'AddRequest.dart';
import 'UserRequestList.dart';

class MyRequests extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Request>>.value(
        value: DatabaseService().requests,
              child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('Mes demandes'),
            
            backgroundColor: Colors.indigo[300],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add request'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      AddRequest()
                    ),
                  );
                  }
              ),
            ],
          ),
          body: UserRequestList()
        ),
      );
   
  }
}