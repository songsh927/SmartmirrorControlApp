import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartmirror_controller/main.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  var ip1OctController = TextEditingController();
  var ip2OctController = TextEditingController();
  var ip3OctController = TextEditingController();
  var ip4OctController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text('스마트미러 서버 네트워크에 접속하여 서버의 IP를 입력하세요'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(3),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: ip1OctController,
                    maxLength: 3,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text('.'),
                Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(3),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: ip2OctController,
                    maxLength: 3,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text('.'),
                Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(3),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: ip3OctController,
                    maxLength: 3,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text('.'),
                Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(3),
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: ip4OctController,
                    maxLength: 3,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),

            TextButton(onPressed: (){
              context.read<SmartmirrorData>().settingIp =
                  ip1OctController.text+'.'+ip2OctController.text+'.'+ip3OctController.text+'.'+ip4OctController.text;
            }, child: Text('입력'))

          ],
        ),
      ),
    );
  }
}

/**
 * child: Row(
    children: [
    TextField(
    controller: ipSetTextController
    ),
    Text('.'),
    TextField(
    controller: ipSetTextController
    ),
    Text('.'),
    TextField(
    controller: ipSetTextController
    ),
    Text('.'),
    TextField(
    controller: ipSetTextController
    ),
    ],
    ),
 */
