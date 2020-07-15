import 'package:co_location/Models/Offer.dart';
import 'package:co_location/Models/User.dart';
import 'package:co_location/views/Offers/UserOfferTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserOfferList extends StatefulWidget {
  @override
  _UserOfferListState createState() => _UserOfferListState();
}

class _UserOfferListState extends State<UserOfferList> {


  @override
  Widget build(BuildContext context) {
    //final u = Provider.of<User>(context);

    final FirebaseAuth _auth = FirebaseAuth.instance;
    getUser() async{
      FirebaseUser u = await _auth.currentUser();
      return u;

    }

    final offers = Provider.of<List<Offer>>(context);

    List<Offer> userOffer= new List<Offer>();

    String u = getUser().toString();
    print(u);
    for (var offer in offers) {


      if(offer.uid==u)
      userOffer.add(offer);
    }
    return ListView.builder(
      itemCount: userOffer.length,
      itemBuilder: (context, index) {

        return UserOfferTile(offer: userOffer[index]);
      },
    );
  }
}