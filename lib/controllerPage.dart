import 'package:flutter/material.dart';
import 'package:smartmirror_controller/curtainSetting.dart';
import 'package:smartmirror_controller/lightSetting.dart';
import 'package:smartmirror_controller/tempSetting.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Column(
        children: [
          /*
          * 전등
          * */
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0,3)
                    )
                  ]
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('전등'),
                      Icon(Icons.power_settings_new),
                      IconButton(
                          icon: Icon(Icons.settings_applications_outlined),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c) => LightSetting()));
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          child: Text('On'),
                          onPressed: (){}),
                      OutlinedButton(
                          child: Text('Off'),
                          onPressed: (){})
                    ],
                  )
                ],
              ),

            ),
          ),
          /*
          * 커튼
          * */
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0,3)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('커튼'),
                      Icon(Icons.power_settings_new),
                      IconButton(
                          icon: Icon(Icons.settings_applications_outlined),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c) => CurtainSetting()));
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          child: Text('On'),
                          onPressed: (){}),
                      OutlinedButton(
                          child: Text('Off'),
                          onPressed: (){})
                    ],
                  )
                ],
              ),
            ),
          ),
          /*
          * 에어컨
          * */
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0,3)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('에어컨'),
                      Icon(Icons.power_settings_new),
                      IconButton(
                          icon: Icon(Icons.settings_applications_outlined),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (c) => TempSetting()));
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          child: Text('On'),
                          onPressed: (){}),
                      OutlinedButton(
                          child: Text('Off'),
                          onPressed: (){})
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
