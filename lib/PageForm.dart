import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:async/async.dart';
import 'dart:io';



class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

final _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _PageFormState extends State<PageForm> {

  DateTime _dataInfo;
  String _dt;

  int selectedRadioTile;

  bool _isSave = false;





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedRadioTile = 0;

    //load json
    _getAllData();
  }

  List _departLists = new List();
  String _selectedDepart;

  //method to feed combobox
  Future _getAllData() async{

    var url = "http://www.71slabsolution.com/crud/getallcat.php";

    final response = await http.get(url);

    if(response.statusCode == 200){
        var data = json.decode(response.body);

        print(response.body);

        setState(() {
          _departLists = data;
        });

    }

  }


  setSelRadio(int val){
    setState(() {
      selectedRadioTile = val;
    });
  }

  List<String> _users = ['USER', 'ADMINISTRATOR']; // Option 2
  String _selecteduser; // Option 2
  String _user;


  TextEditingController fntxt = new TextEditingController();
  TextEditingController addrtxt = new TextEditingController();



  Future _saveRecord(BuildContext context) async{
      //fntxt,addrtxt,_dt,_selectedDepart,_selecteduser,selectedRadioTile
    /*
    $fname = $_POST['fnval'];
$addr = $_POST['addrval'];
$dt = $_POST['dt'];
$tuser = $_POST['tuserval'];
$dep = $_POST['depval'];
$gender = $_POST['genval'];

    * */


      var url = "http://www.71slabsolution.com/crud/savedata.php";

    final response = await http.post(url,body: {
      "fnval":fntxt.text,
      "addrval":addrtxt.text,
      "dt":_dt,
      "tuserval":_selecteduser,
      "depval":_selectedDepart.toString(),
      "genval":selectedRadioTile.toString(),
    });

    if(response.statusCode == 200){

      var data = json.decode(response.body);

      if(data['msg'] == 1){
        print("YEHUUU");
        setState(() {
          _isSave = false;
        });
        
        _scaffoldKey.currentState.showSnackBar(new SnackBar(backgroundColor:Colors.redAccent,content: new Text('Your data has been saved badigol',style: TextStyle(color: Colors.white),)));

        Timer timer = new Timer(new Duration(seconds: 3), (){
          Navigator.of(context).pop();
        });
      }else if(data['msg'] == 0){
        print("WEKKK");

        _isSave = true;
      }


    }



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
                  setState(() {
                    _isSave = true;
                  });

                  _saveRecord(context);
              },
              child:_isSave? new CircularProgressIndicator() :Text('SAVE',style: TextStyle(
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
                        controller: fntxt,
                        decoration: InputDecoration(
                          labelText: 'Fullname',
                        ),
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                      ),
                      TextFormField(
                        controller: addrtxt,
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                        textCapitalization: TextCapitalization.characters,
                        maxLines: 3,
                        //maxLength: 100,
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
                            onPressed: () async{

                              final selectedDate = await showDatePicker(context: context,
                                  initialDate: DateTime.now().add(Duration(seconds: 1)),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100)
                              );


                              if(selectedDate != null && selectedDate != _dataInfo){
                                //setState(() {
                                _dataInfo = selectedDate;

                                List dtlist = _dataInfo.toString().split(" ");

                                String dtstr = dtlist[0].toString();

                                //print(dtstr);
                                //});

                                setState(() {
                                  _dt = dtstr;
                                  //print(_dt);
                                });

                              }

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

                          setSelRadio(val);

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
                            setSelRadio(val);
                        },
                        activeColor: Colors.pinkAccent,
                        selected: false,
                        title: Text('Female',style: TextStyle(
                            color: Colors.black87
                        ),),
                      ),
                      SizedBox(height: 10.0,),

                      DropdownButton(
                          isExpanded: true,
                          hint: new Text('Select User Type'),
                          value: _selecteduser,
                          items: _users.map((location){
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                          onChanged: (newValue){
                            print(newValue);

                            setState(() {
                              _selecteduser = newValue;
                            });

                          }
                      ),

                      DropdownButton(
                          isExpanded: true,
                          hint: new Text('Select Department'),
                          onChanged: (newValue){
                            print(newValue);

                            setState(() {
                              _selectedDepart = newValue;
                            });
                          },
                        value: _selectedDepart,
                        items: _departLists.map((item){

                          return DropdownMenuItem(
                              child: new Text(item['DEPT_NAME']),
                              value: item['IDDEP'].toString(),
                          );

                        }).toList(),
                      ),

                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
