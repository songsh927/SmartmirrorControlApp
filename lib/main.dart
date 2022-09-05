import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllerPage.dart';
import 'schedulePage.dart';
import 'settingPage.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (c) => AppData()),
    ],
    child: MaterialApp(
        home: MyApp()
    ),)
  );
}

class AppData extends ChangeNotifier{

  List scheduleData = [
    {
      'date' : '20220808',
      'title' : 'hello',
      'text' : 'Flutter'
    },
    {
      'date' : '20220808',
      'title' : 'google',
      'text' : 'Flutter'
    }
  ];

  getSchedule(){}

  addSchedule(){}



}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        SchedulePage(),
        ControllerPage(),
        SettingPage()
      ][tab],

      bottomNavigationBar: BottomNavigationBar(

        showSelectedLabels: false,
        showUnselectedLabels: false,

        onTap: (i){
          setState((){
            tab = i;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(tab == 0 ? Icons.today_outlined : Icons.today , color: Colors.blueGrey,),
            label: 'schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(tab == 1 ? Icons.control_camera_outlined : Icons.control_camera , color: Colors.blueGrey,),
            label: 'controller',
          ),
          BottomNavigationBarItem(
            icon: Icon(tab == 2 ? Icons.settings_applications_outlined : Icons.settings_applications , color: Colors.blueGrey,),
            label: 'controller',
          )
        ],
      ),
    );
  }
}




