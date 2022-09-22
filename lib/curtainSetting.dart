import 'package:flutter/material.dart';

class CurtainSetting extends StatelessWidget {
  const CurtainSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curtain Setting'),
      ),
      body: Container(
        child: Text('curtain setting'),
      ),
    );
  }
}
