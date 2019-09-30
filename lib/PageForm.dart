import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

final _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _PageFormState extends State<PageForm> {

  DateTime _dtInfo;
  String _dt;

  int selectedRadioTile;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedRadioTile = 0;
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text('FORM'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new FlatButton(
              onPressed: (){

              },
              child: Text('SAVE',style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),),
          ),
        ],
      ),
      body: new SingleChildScrollView(
              child: new Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(14.0),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    children: <Widget>[
                      TextFormField(
                        //controller: fntxt,
                        decoration: InputDecoration(
                          labelText: 'Fullname',
                        ),
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                      ),
                      TextFormField(
                        //controller: fntxt,
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                        textCapitalization: TextCapitalization.characters,
                        maxLines: 3,
                      ),
                      SizedBox(height: 20.0,),
                      Text(_dt == null?' - DOB - ':_dt,style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 10.0,),
                      Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            onPressed: (){
                              
                            },
                            child: Text('Select Date',style: TextStyle(
                              color: Colors.white,
                            ),),
                            color: Colors.purple,
                          ),
                      ),
                      SizedBox(height: 20.0,),
                      Align(
                        child: Text('Gender',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),),
                        alignment: Alignment.centerLeft,
                      ),
                      RadioListTile(
                        value: 0,
                        groupValue: selectedRadioTile,
                        onChanged: (val){

                        },
                        activeColor: Colors.pinkAccent,
                        selected: true,
                        title: Text('Male',style: TextStyle(
                            color: Colors.black87
                        ),),
                      ),
                      RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        onChanged: (val){

                        },
                        activeColor: Colors.pinkAccent,
                        selected: false,
                        title: Text('Female',style: TextStyle(
                            color: Colors.black87
                        ),),
                      ),
                      SizedBox(height: 10.0,),
                      new DropdownButton(
                        isExpanded: true,
                        hint: new Text('Select User Type'),
                        onChanged: (newVal) {

                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}