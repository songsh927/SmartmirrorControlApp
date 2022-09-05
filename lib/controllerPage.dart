import 'package:flutter/material.dart';

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
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.green,
              height: 150,
              child: Text('1'),
            ),
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.amber,
              height: 150,
              child: Text('2'),
            ),
            Container(
              margin: EdgeInsets.all(5),
              color: Colors.blueGrey,
              height: 150,
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
