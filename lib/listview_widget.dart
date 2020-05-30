import 'package:flutter/material.dart';


class ListAppPage extends StatefulWidget {
  @override
   String name = "";
  ListAppPage(nme){
    name = nme;
  }
  ListAppPageState createState() => new ListAppPageState();
}


class ListAppPageState extends State<ListAppPage> {
  List<String> listItems =[];
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        appBar: AppBar(title: Text("Welcome")),
        body: Column(children: <Widget>[
          Text("Hello, " + widget.name,key:Key("loggedinPageWelcomeText"), style: TextStyle(fontSize:20)),
          ListAppWidget(listItems),
          RaisedButton(
                        onPressed: () {n +=1 ;
                        listItems.add("item:" + n.toString());
                        setState(() {});
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.lightBlueAccent)
                              ),
                        child: Text(
                        'Add',
                        style: TextStyle(fontSize: 15,color: Colors.white)
                        ),
                          )
                    
        ],)
      )
    );
  }

}



//The widget to be tested
class ListAppWidget extends StatefulWidget {
  List<String> listItems =[];
  ListAppWidget(List<String> lst){
    listItems.clear(); listItems.addAll(lst); 
  }

  @override
  ListAppWidgetState createState() => new ListAppWidgetState();
}


class ListAppWidgetState extends State<ListAppWidget> {
  @override
  Widget build(BuildContext context) {
    return(
      Container(
        width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/2,
        padding: EdgeInsets.only(left:10,right:10,top:20,bottom:20),
        child: ListView.builder(
          key:Key("myListView"),
          itemCount: widget.listItems.length,
          itemBuilder: (BuildContext ctxt, int index) {
          return Card(child:Container(
            height:100,
            child:Center(child:Text( widget.listItems[index], key:Key("listViewText"))))
         
          
          );
          }
        )
      )
    
    );
  }

}