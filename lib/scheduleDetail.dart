import 'package:flutter/material.dart';

class ScheduleDetail extends StatelessWidget {
  const ScheduleDetail({Key? key, this.scheduleData}) : super(key: key);

  final scheduleData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scheduleData['title']),
      ),
      body: Container(
        child: Column(
          children: [
            Text('date ${scheduleData['date']}'),
            Text('title: ${scheduleData['title']}'),
            Text('text: ${scheduleData['text']}')
          ],
        ),
      ),
    );
  }
}
