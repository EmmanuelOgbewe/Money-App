import 'package:flutter/material.dart';
import 'package:cash_app/ui/home_screen.dart';
import 'package:cash_app/ui/profile_screen.dart';
import 'package:cash_app/ui/activity_screen.dart';
import 'package:cash_app/ui/cash_card_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  PageController controller;
  PageController nestedPageController;

  @override 
  void initState(){
    super.initState();
    controller = new PageController(initialPage: 1);
    nestedPageController = new PageController(initialPage: 1);
  
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ProfileScreen(controller: controller),
            PageView(
              controller: nestedPageController,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics() ,
              children: <Widget>[
                 CashCardScreen(controller: nestedPageController),
                 HomeScreen(controller: controller, nestedController: nestedPageController)
              ],
            ),
             ActivityScreen(controller: controller),
          ],
        ),
    );
  }

}

