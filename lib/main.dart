import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
  )
  );
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
      appBar: AppBar(
        title: Text('SmartMirror Controller'),
      ),

      body: [
        schedulePage(),
        controllerPage(),
        settingPage()
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
            icon: Icon(Icons.today_outlined),
            label: 'schedule',
            activeIcon: Icon(Icons.today),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: 'controller',
            activeIcon: Icon(Icons.today),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: 'setting',
            activeIcon: Icon(Icons.today),
          ),
        ],
      ),

    );
  }
}

class schedulePage extends StatefulWidget {
  const schedulePage({Key? key}) : super(key: key);

  @override
  _schedulePageState createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('달력 및 스케줄 페이지'),
    );
  }
}

class controllerPage extends StatefulWidget {
  const controllerPage({Key? key}) : super(key: key);

  @override
  _controllerPageState createState() => _controllerPageState();
}

class _controllerPageState extends State<controllerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('주변기기 제어페이지'),
    );
  }
}

class settingPage extends StatelessWidget {
  const settingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('세팅페이지'),
    );
  }
}



