import 'package:co_location/Models/Request.dart';
import 'package:co_location/Service/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:co_location/Views/menu.dart';
import 'package:provider/provider.dart';
import 'AddRequest.dart';
import 'RequestList.dart';
class Requests extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Request>>.value(
        value: DatabaseService().requests,
              child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('All Requests'),
            
            backgroundColor: Colors.indigo[300],
            elevation: 0.0,
            
          ),
          body: RequestList()
        ),
      );
   
  }
}