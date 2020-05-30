import 'package:flutter_driver/flutter_driver.dart' ;
import 'package:test/test.dart';

void main() {
  group('Integration Testing App', () {
    //create a driver
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    //this is the actual test
    test('app test', () async {
      String name = "Pikachu"; //Define the name to be passed
      int noOfItemsTobeAdded = 5;
      //wait until the app loads
      await driver.waitUntilFirstFrameRasterized();
      print("App loaded");

      //tap the text field
      await driver.tap(find.byValueKey("enterYourNameText"));
      print("Text field focused");

      await driver.enterText(name);
      print("Name entered");

      print("Attempting to login");
      await driver.tap(find.text("Enter"));

      //wait for page navigation and check if we got in
      await driver.waitForCondition(NoPendingFrame());
      expect(await driver.getText(find.byValueKey("loggedinPageWelcomeText")), "Hello, " + name);
      print("Logged in");

      //add items
      print("adding items to list");   
      for(int i =1; i <= noOfItemsTobeAdded; i++) { 
          await driver.tap(find.text( 'Add'));}
      
      //scroll
      await driver.scroll(find.byValueKey("myListView"), 0, (-3.0*100), Duration(milliseconds: 1000));
    });
  });
}