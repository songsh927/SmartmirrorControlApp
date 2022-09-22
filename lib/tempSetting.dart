import 'package:flutter/material.dart';

class TempSetting extends StatelessWidget {
  const TempSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp Setting'),
      ),
      body: Container(
        child: Text('temp setting'),
      ),
    );
  }
}
