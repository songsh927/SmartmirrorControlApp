import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartmirror_controller/main.dart';
import 'package:smartmirror_controller/scheduleDetail.dart';
import 'addSchedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  var scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduler'),
        actions: [
          IconButton(
              icon: Icon(Icons.add_box_outlined) ,
              onPressed: (){
                showDialog(context: context, builder: (context){
                  return AddSchedule();
                });
              }
          ),
          IconButton(
              icon: Icon(Icons.refresh) ,
              onPressed: (){
                context.read<SmartmirrorData>().scheduleData.clear();
                context.read<SmartmirrorData>().getSchedule();
              }
          )
        ],
      ),
      body: ListView.builder( itemCount: context.watch<SmartmirrorData>().scheduleData.length,controller: scroll ,itemBuilder: (c,i){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (c) => ScheduleDetail(scheduleData: context.watch<SmartmirrorData>().scheduleData[i],)));
          },
          child: Container(
            height: 100,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text('Date : '+ context.read<SmartmirrorData>().scheduleData[i]['date'].toString()),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black26,
                              width: 1.0
                          )
                      )
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text('Title : '+ context.read<SmartmirrorData>().scheduleData[i]['title'].toString()),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black26,
                        width: 1.0
                      )
                    )
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.check_box_outlined),
                        onPressed: () async {
                          await context.read<SmartmirrorData>().deleteSchedule(context.read<SmartmirrorData>().scheduleData[i]['idx']);
                        }
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white70,
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0,3)
                )
              ]
            ),
          ),
        );
      })
    );
  }
}
