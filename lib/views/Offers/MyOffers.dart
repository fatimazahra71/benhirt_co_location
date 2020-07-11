import 'package:co_location/Models/Offer.dart';
import 'package:co_location/Service/DatabaseService.dart';
import 'package:co_location/views/Offers/UserOfferList.dart';
import 'package:flutter/material.dart';
import 'package:co_location/views/menu.dart';
import 'package:provider/provider.dart';
import 'AddOffer.dart';

class MyOffers extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Offer>>.value(
        value: DatabaseService().offers,
              child: Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('Mes offres'),
            
            backgroundColor: Colors.indigo[300],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add Offer'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                      AddOffer()
                    ),
                  );
                  }
              ),
            ],
          ),
          body: UserOfferList()
        ),
      );
   
  }
}