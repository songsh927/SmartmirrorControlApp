import 'package:flutter/material.dart';

class LightSetting extends StatelessWidget {
  LightSetting({Key? key}) : super(key: key);

  var redValueController = TextEditingController();
  var greenValueController = TextEditingController();
  var blueValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light Setting'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Red Value'),
          SizedBox(
            child: TextField(
              controller: redValueController,
            ),
          ),
          Text('Green Value'),
          SizedBox(
            child: TextField(
              controller: greenValueController,
            ),
          ),
          Text('Blue Value'),
          SizedBox(
            child: TextField(
              controller: blueValueController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  child: Text('확인'),
                  onPressed: (){
                    //send data to server

                  }
              ),
              OutlinedButton(
                  child: Text('취소'),
                  onPressed: (){ Navigator.pop(context);}
              ),
            ],
          )
        ],
      ),
    );
  }
}
