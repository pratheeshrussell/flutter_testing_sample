import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import our widget
import 'package:test_app1/listview_widget.dart';

void main() { 
  testWidgets('testing listview widget', (WidgetTester tester) async {  
        // the items to add to list
        List<String> listItems = ["item 1","item 2","item 3"];

        //start the widget
        await tester.pumpWidget(
         MaterialApp(home: ListAppWidget(listItems))
          );

        //find all text widgets
        List<Widget> asd = tester.widgetList(find.byType(Text)).toList();
        int n = 0;

        //verify
        asd.forEach((element) {       
          expect(element.toString().contains(listItems[n]), true, reason: "Not found");
          print(listItems[n] + " found"); 
           n += 1;
           });
      });
    }