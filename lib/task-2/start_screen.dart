import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:internship/task-2/contact_screen.dart';
import 'package:internship/task-2/home_screen.dart';
import 'package:internship/task-2/setting_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int my_index=0;
  List<Widget> screens=[
    ContactScreen(),
    HomeScreen(),
    Settings()

  ];
  final PageStorageBucket pageStorageBucket=PageStorageBucket();
  Widget currentScreen=ContactScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
         backgroundColor: Colors.transparent,
       buttonBackgroundColor: my_index==0 ||my_index== 1||my_index==2 ?Colors.purple:Colors.white,
        animationCurve: Curves.fastLinearToSlowEaseIn,color: Colors.purple,
        index: my_index,
        height: 60.0,
        items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white,),
            Icon(Icons.contact_mail_outlined, size: 30, color: Colors.white,),
            Icon(Icons.settings, size: 30, color: Colors.white,),



    ],
         onTap: (index)=>setState(() {
            my_index=index;
         }),
    ),

      body: screens[my_index] ,
    );
  }
}
