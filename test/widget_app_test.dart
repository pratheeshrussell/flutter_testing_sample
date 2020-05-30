import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import our app
import 'package:test_app1/main.dart';

//Widget testing of full app

void main() { 
  testWidgets('testing my app', (WidgetTester tester) async {  
        String name = "Pikachu"; //Define the name to be passed
        int noOfItemsTobeAdded = 3;
        //Start our app
        await tester.pumpWidget(MyApp());
        
        //search for the name entering field and enter the name
        expect(find.widgetWithText(TextField, 'Enter your name'), findsOneWidget);
        print("entering name as " + name);
        await tester.enterText(find.widgetWithText(TextField, 'Enter your name'), name);  

        //find the enter button using the text found in it
        expect(find.widgetWithText(RaisedButton, 'Enter'), findsOneWidget);
        print("Enter button found, will press it now");

        //tap the button
        await tester.tap(find.widgetWithText(RaisedButton, 'Enter'));

        //wait for the navigator push
        await tester.pumpAndSettle();
       
        //verify if the hello message is found
        print("searching for hello text");    
        expect(find.text("Hello, " + name), findsOneWidget);
        print("hello text found");

        //verify if the hello message is found
        print("adding items to list");   
        for(int i =1; i <= noOfItemsTobeAdded; i++) { await tester.tap(find.widgetWithText(RaisedButton, 'Add'));}

        //rebuild tree
        await tester.pumpAndSettle();

        //verify item count
        print("verifying item count");  
        expect(tester.widgetList(find.byKey(Key("listViewText"))).toList().length, noOfItemsTobeAdded,
         reason: "count does not match");

        //check if items were added
        print("Item count ok. Verifying items");  
        for(int i =1; i <= noOfItemsTobeAdded; i++) { 
          expect(find.widgetWithText(Card, "item:" + i.toString()), findsOneWidget, reason: "Not found");
          print("item:" + i.toString() + " found"); 
        }
      });
    }