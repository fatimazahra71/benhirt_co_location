import 'package:co_location/views/Offers/AddOffer.dart';
import 'package:co_location/views/Offers/MyOffers.dart';
import 'package:co_location/views/Requests/AddRequest.dart';
import 'package:co_location/views/Requests/MyRequests.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child:Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(6),
              color: Colors.white,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                       margin: EdgeInsets.only(
                      top: 45,
                      bottom: 10),
                      width: 120,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/house.png'),
                          fit: BoxFit.fill,
                        ),
                        ),
                    ), 
                    Text("Co-Location",
                    style: TextStyle(
                      
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold
                    ),
                    )
                   
                  ],
                ),
              ),
            ),
            
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'
                    ),

              dense:false,
              onTap: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Home()
                  )
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Ajouter une offre'),
              dense:false,
              
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        AddOffer()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Mes offres'),
              dense:false,

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          MyOffers()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Ajouter une demande'),
              dense:false,
              onTap: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        AddRequest()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Mes demandes'),
              dense:false,

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          MyRequests()
                  ),
                );
              },
            ),
            
           
            
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Déconnexion'),
              dense:false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Login()
                  ),
                );
               },
            ),

            ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text('Des problèmes ? Contactez nous'),
              dense:false,
              onTap: () {
               },
            ),
            
          ],
        )
      );
  }
}