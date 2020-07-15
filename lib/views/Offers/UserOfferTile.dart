import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_location/Models/Offer.dart';
import 'package:flutter/material.dart';

class UserOfferTile extends StatelessWidget {
  final Offer offer;
  UserOfferTile({this.offer});
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Supprimer"),
            content: new Text("Voulez vous supprimer cette offre ? "),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Supprimer"),
                onPressed: () async{
                  await db.collection('Offers').document(offer.id).delete();
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text("Annuler"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return Container(
      padding:  EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
          ),
          title: Text(offer.price.toString()+ 'DH'),
          subtitle: Text(offer.description),
          trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: () {  _showDialog(); },),

          onTap: () {
            showDialog(
                context: context,
                child: new SimpleDialog(
                    title: new Text(
                        offer.user_name,
                        textAlign: TextAlign.center,
                        style :TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold

                        )),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text(" Adresse : "+offer.address) ,
                      ),
                      ListTile(
                        leading: Icon(Icons.monetization_on),
                        title :Text(" Prix : "+offer.price.toString()+" DH"),
                      ),
                      ListTile(
                        leading: Icon(Icons.group),
                        title :Text(" Capacité  : "+offer.capacity.toString() +" Person"),
                      ),
                      ListTile(
                        leading: Icon(Icons.aspect_ratio),
                        title :Text(" Superficie : "+offer.surface.toString()+" M²"),
                      ),
                      ListTile(
                          leading: Icon(Icons.phone),
                          title :Text(" Téléphone : "+offer.user_phone)
                      ),
                      ListTile(
                          leading: Icon(Icons.mail),
                          title :Text(" email : "+offer.user_email)
                      ),

                    ])





            );
          },
        ),
      ),
    );
  }
}


