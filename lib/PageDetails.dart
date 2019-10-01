import 'package:flutter/material.dart';



class PageDetails extends StatefulWidget {
  List lists;
  int index;

  PageDetails({this.lists,this.index});


  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {

  Future _delFunct()async{

    var url = "htpbalalalaa/crud/deletedata.php";
    //post
     final response = await http.post(url,body:{
       "id":widget.lists[widget.index]['IDDATA'],

     });


     if(response.statusCode == ){

     }





  }



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
                _delFUnct(context);
              }
          ),

        ],
      )
    );
  }
}
