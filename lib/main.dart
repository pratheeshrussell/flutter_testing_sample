import 'package:flutter/material.dart';
import 'listview_widget.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing sample',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
   TextEditingController nameField = new TextEditingController();  
   
    @override
    Widget build(BuildContext context) {
      return Scaffold(       
        backgroundColor: Colors.black,
        body:  
        GestureDetector(
        onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
         child: SingleChildScrollView(
          child:Column(children: <Widget>[
                Container(
                  color: Colors.blue,        
                  height: MediaQuery.of(context).size.height * 0.3,
                  child:Center(
                    child: Text("Awesome App",style: TextStyle(fontFamily: 'Cursive',fontSize: 40, 
                    color: Colors.white, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),),
                  )),

                Container(
                height:MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.only(left:50,right:50),
                child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                     TextField(
                       key : Key("enterYourNameText"),
                       decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(borderSide: const BorderSide(color: Colors.lightBlue),),
                      fillColor: Colors.white,
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.lightBlue),),
                      controller: nameField,
                      style: new TextStyle(fontSize: 15.0,color: Colors.white)),                  
                      Container(height:25,),
                      RaisedButton(
                        onPressed: () {
                          if(Validator.validate(nameField.text)){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => new ListAppPage(nameField.text)),);
                          }
                          },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.lightBlueAccent) ),
                        child: Text('Enter',
                        style: TextStyle(fontSize: 15,color: Colors.white)),),
                ])),
            ],
          ),
          ),
      ));
    }
}


class Validator{
 static bool validate(str){
    if(str.length > 0){
      return true;
    }
    return false;
  }
}