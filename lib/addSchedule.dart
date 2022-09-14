import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartmirror_controller/main.dart';

class AddSchedule extends StatelessWidget {
  AddSchedule({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('스케줄 추가'),
            Text('date'),
            TextField(
              controller: dateController,
            ),
            Text('title'),
            TextField(
              controller: titleController,
            ),
            Text('text'),
            TextField(
              controller: textController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    child: Text('확인'),
                    onPressed: (){
                      context.read<SmartmirrorData>().addSchedule(dateController.text, titleController.text, textController.text);
                      Navigator.pop(context);
                    }),
                OutlinedButton(
                    child: Text('취소'),
                    onPressed: (){
                      Navigator.pop(context);
                    }),
              ],
            )

          ],
        )
      ),
    );
  }
}
