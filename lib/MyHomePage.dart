import 'package:flutter/material.dart';


import 'package:tutorialcrud/PageForm.dart';
import 'package:tutorialcrud/PageList.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            new Row(
              children: <Widget>[
                Expanded(
                    child:  new InkWell(
                      child: new Card(
                        child: new Container(
                          child: new Center(
                            child: Text('FORM',style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          height: 200.0,
                          width: MediaQuery.of(context).size.width*0.4,
                          color: Colors.redAccent,
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new PageForm()));
                      },
                    ),
                ),
                Expanded(
                  child:  new InkWell(
                    child: new Card(
                      child: new Container(
                        child: new Center(
                          child: Text('LIST',style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        height: 200.0,
                        width: MediaQuery.of(context).size.width*0.4,
                        color: Colors.redAccent,
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => new PageList()));
                    },
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),

          ],
        ),
      ),
    );
  }
}
