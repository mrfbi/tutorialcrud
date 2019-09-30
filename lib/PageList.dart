import 'package:flutter/material.dart';



class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('LIST'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Center(
        child: new CircularProgressIndicator(backgroundColor: Colors.purpleAccent,),
      ),
    );
  }
}
