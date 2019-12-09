import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class PageDetails extends StatefulWidget {
  List lists;
  int index;

  PageDetails({this.lists,this.index});


  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('DETAILS'),
      ),
      body: new Column(
        children: <Widget>[
          new Center(
            child: Text(widget.lists[widget.index]['ADDR']+" "+widget.lists[widget.index]['IDDATA']),
          ),
          RaisedButton(
              onPressed: (){

              }
          ),

        ],
      )
    );
  }
}
