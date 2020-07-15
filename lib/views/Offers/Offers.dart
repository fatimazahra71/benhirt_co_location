import 'package:co_location/Models/Offer.dart';
import 'package:co_location/Service/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:co_location/views/menu.dart';
import 'package:provider/provider.dart';

import 'package:co_location/views/Offers/OfferList.dart';

class Offers extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Offer>>.value(
        value: DatabaseService().offers,
              child: Scaffold(
                drawer: Menu(),
                appBar: AppBar(
                  title: Text('All Offers'),

                  backgroundColor: Colors.indigo[300],
                  elevation: 0.0,

                ),
                body: OfferList()
              ),
      );

  }
}