import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';




class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  TextEditingController _untxt = new TextEditingController();
  TextEditingController _uptxt = new TextEditingController();


  Future _loginApps(BuildContext context) async{


    if(_untxt.text == "admin" && _uptxt.text == "abc123"){

      //print("YUHUUU");
      Navigator.pushReplacementNamed(context, "/PageHome");

    }else{
      print("WEEEKk");
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _untxt,
                    decoration: InputDecoration(
                      labelText: "USERNAME"
                    ),
                  ),
                  TextFormField(
                    controller: _uptxt,
                    decoration: InputDecoration(
                        labelText: "PASSWORD"
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                        onPressed: (){

                          _loginApps(context);

                        },
                      child: Text('LOGIN'),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
