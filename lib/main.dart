import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'controllerPage.dart';
import 'schedulePage.dart';
import 'settingPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => SmartmirrorData()),
    ],
    child: MaterialApp(
        home: MyApp()
    ),)
  );
}

class SmartmirrorData extends ChangeNotifier{


  var scheduleData = [];
  //var settingIp = '192.168.0.7';
  var settingIp = 'localhost';

  //스케줄 데이터 가져오는 함수
  getSchedule() async{
    http.Response res;

    try{
      res = await http.get(
        Uri.parse('http://${settingIp}:3000/schedule'),
        headers: {"Content-type" : "application/json"},
      );
    }catch(e){
      print('please reset your Server IP');
      return 'please reset your Server IP';
    }

    if(res.statusCode == 200){
      var schedules = jsonDecode(res.body);
      scheduleData.addAll(schedules);
      notifyListeners();
    }
  }

  //스케줄 데이터 추가 함수
  addSchedule(date, title, text) async{

    http.Response res = await http.post(
      Uri.parse('http://${settingIp}:3000/schedule'),
      headers: {"Content-type" : "application/json"},
      body: jsonEncode({
        'date' : date.toString(),
        'title': title.toString(),
        'text' : text.toString()
      })
    );

    if(res.statusCode == 201){
      var schedule = jsonDecode(res.body);
      scheduleData.add(schedule);
      notifyListeners();
    }

    if(res.statusCode != 201){
      var errorMsg = jsonDecode(res.body)['message'];
    }

  }

  //기존 스케줄 데이터 업데이트
  updateSchedule(id,date, title, text){

  }

  //특정 스케줄 데이터 삭제
  deleteSchedule(id) async{
    http.Response res = await http.delete(
      Uri.parse('http://${settingIp}:3000/schedule/${id}'),
      headers: {"Content-type" : "application/json"},
    );

    if(res.statusCode == 204){
      for (int i = 0 ; i < scheduleData.length ; i++) {
        if(id == scheduleData[i]['id']){
          scheduleData.removeAt(i);
        }
      }
      notifyListeners();
    }

    if(res.statusCode != 204){
      /**
       * 에러메세지 추가
       * */
      print('error!');
    }
  }

  //모듈 전원 ON 컨트롤러
  moduleOnController(moduleName, options) async{

    http.Response res = await http.post(
        Uri.parse('http://${settingIp}:3000/remote/${moduleName}'),
        headers: {"Content-type" : "application/json"},
        body: jsonEncode(options)
    );

  }

  //모듈 전원 OFF 컨트롤러
  moduleOffController(moduleName, ctrl) async{

    http.Response res = await http.post(
        Uri.parse('http://${settingIp}:3000/remote/${moduleName}'),
        headers: {"Content-type" : "application/json"},
        body: jsonEncode(ctrl)
    );

  }

  moduleGetStatus(moduleName) async{

    http.Response res;

    try{
      res = await http.post(
        Uri.parse('http://${settingIp}:3000/remote/${moduleName}'),
      );
    }catch(e){
      return AlertDialog(
        title: Text('연결 실패'),
        content: Text('IP연결을 확인하세요'),
        actions: [],
      );//'plz reset IP';
    }


    if(res.statusCode == 200){

    }
  }

}


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
    context.read<SmartmirrorData>().getSchedule();
  }

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
            icon: Icon(tab == 0 ? Icons.today : Icons.today_outlined , color: Colors.blueGrey,),
            label: 'schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(tab == 1 ? Icons.contactless : Icons.contactless_outlined , color: Colors.blueGrey,),
            label: 'controller',
          ),
          BottomNavigationBarItem(
            icon: Icon(tab == 2 ? Icons.settings_applications : Icons.settings_applications_outlined , color: Colors.blueGrey,),
            label: 'controller',
          )
        ],
      ),
    );
  }
}




