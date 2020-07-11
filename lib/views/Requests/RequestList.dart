import 'package:co_location/Models/Request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'RequestTile.dart';

class RequestList extends StatefulWidget {
  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {

    final requests = Provider.of<List<Request>>(context);

    return ListView.builder(
      itemCount: requests.length ?? 0,
      itemBuilder: (context, index) {
        return RequestTile(request: requests[index]);
      },
    );
  }
}