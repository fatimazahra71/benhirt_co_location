import 'package:co_location/Models/Offer.dart';
import 'package:co_location/Models/Request.dart';

class User {
  String uid;
  String name;
  String email;
  String phone;
  List<Request> requestList;
  List<Offer> offerList;
  
  User(this.uid , this.name, this.email,this.phone);
  
 

}