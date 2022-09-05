import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartmirror_controller/main.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduler'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: Container(
        child: ListView.builder( itemCount: context.read<AppData>().scheduleData.length, itemBuilder: (c,i){
          return Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Text(context.read<AppData>().scheduleData[i]['title']),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
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
          );
        }),
      )
    );
  }
}
