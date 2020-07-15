import 'package:co_location/Models/Offer.dart';
import 'package:co_location/Service/DatabaseService.dart';
import 'package:co_location/views/Offers/MyOffers.dart';
import 'package:co_location/views/home.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
class AddOffer extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  
  final DatabaseService _databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String comment = '';
  String address;
  double surface;
  double price;
  int capacity;
  String description = '';
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
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adresse :  *',
                ),
                validator: (val) => val.isEmpty ? 'Entrez une adresse' : null,
                onChanged: (val) {
                  setState(() => address = val

                      
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Superficie :  *',
                ),
                validator: (val) => val.isEmpty ? 'Entrez une superficie' : null,
                onChanged: (val) {
                  setState(() => surface = double.parse(val));
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Prix*',
                ),
                validator: (val) => val.isEmpty ? 'Entrez un prix' : null,
                onChanged: (val) {
                  setState(() => price = double.parse(val));
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre de personnes *',
                ),
                validator: (val) => val.isEmpty ? 'Entrez un nombre de personnes ' : null,
                onChanged: (val) {
                  setState(() => capacity = int.parse(val));
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Propriétés *',
                ),
                validator: (val) => val.isEmpty ? 'Entrez des propriétés' : null,
                onChanged: (val) {
                  setState(() => description = val);
                },
              ),
              RaisedButton(
                  color: Colors.indigo[300],
                  child: Text(
                    'Confirmer',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);          
                     
                      await _databaseService.updateUserOffer(new Offer('','',
                        address, surface, capacity, price, description, null,null,null ,null,null));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
