  import 'package:co_location/Models/Request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestTile extends StatelessWidget {

  final Request request;
  RequestTile({ this.request });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Icon(Icons.error_outline,color: Colors.redAccent[700],size: 50,

           
          ),
          title: Text('Budget :'+ request.maxBudget.toString()+ ' DH'),
          subtitle: Text(request.comment),
          onTap: () {
            showDialog(
                context: context,
                child:  SimpleDialog(
                  title:  Text(
                    request.user_name,
                    textAlign: TextAlign.center,
                    style :TextStyle(  
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                      
                    )),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(" Max budget : "+request.maxBudget.toString()+" DH") ,
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title :Text(" Phone : "+request.user_phone)
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title :Text(" email : "+request.user_email)
                    ),
                    
                  ])
                   
                    
                    
                
                  
              );
          },
        ),
      ),
    );
  }
}