import 'package:co_location/views/Offers/Offers.dart';
import 'package:co_location/views/Requests/Requests.dart';
import 'package:co_location/views/login.dart';
import 'package:co_location/views/menu.dart';
import 'package:co_location/views/Offers/OfferList.dart';
import 'package:flutter/material.dart';
import 'package:co_location/views/map.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        backgroundColor: Colors.indigo[300],
        
      ),

      drawer: Menu(),
      
      body:Column(
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
                      top: 25,
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
                      
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),
                    )
                   
                  ],
                ),
              ),
            ),
            
            
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Les offres',style: TextStyle(
                      
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal
                    ),
              ),
              
              dense:false,
              onTap: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Offers()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Les demandes', style: TextStyle(
                      
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal
                    ),
              ),
              dense:false,
              onTap: () {
               Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Requests()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Voir sur la carte',style: TextStyle(
                      
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal
                    ),
              ),
              dense:false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Map()
                  ),
                );
              },
            ),
            
            
          ],
        )
      );
  }
}