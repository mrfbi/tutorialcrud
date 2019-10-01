import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:async/async.dart';
import 'dart:io';

import 'package:tutorialcrud/PageForm.dart';
import 'package:tutorialcrud/PageDetails.dart';



class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {


  Future _getAllData() async{

    var url = "http://www.71slabsolution.com/crud/getalldata.php";

    final response = await http.get(url);

    //print(response.statusCode.toString());

    print(response.body);

    if(response.statusCode == 200){

      return json.decode(response.body);

      print(response.body);

    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getAllData();

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('LIST'),
        backgroundColor: Colors.deepPurple,
      ),
      body:new SafeArea(
          child: new FutureBuilder(
            future:_getAllData() ,
            builder: (context, snapshot){
              
              if(snapshot.connectionState == ConnectionState.waiting){
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              }else if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  return new ItemList(list: snapshot.data);
                }
              }
              
              
            },
          ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new PageForm()));
          },
          child: Icon(Icons.add),
      ),
    );
  }
}


class ItemList extends StatelessWidget {
  //AnimationController _controller;

  List list;

  ItemList({this.list});


  @override
  Widget build(BuildContext context) {

    return new ListView.separated(
      itemCount: list==null?0:list.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.black87,
      ),
      itemBuilder: (context,i){

        return new ListTile(
          title:Text('HUHUH'),
          subtitle: Text(list[i]['ADDR']),
          trailing: Icon(Icons.arrow_forward),
          leading: Icon(Icons.account_circle),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new PageDetails(lists: list,index: i,)));
          },
        );

      },
    );
  }
}
