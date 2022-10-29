import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartmirror_controller/main.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class TempSetting extends StatefulWidget {
  const TempSetting({Key? key}) : super(key: key);

  @override
  State<TempSetting> createState() => _TempSettingState();
}

class _TempSettingState extends State<TempSetting> {
  DateTime tempOnTime = DateTime.now();
  DateTime tempOffTime = DateTime.now();

  void _onTimePickerSheet(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        minuteInterval: 5,
        sheetTitle: 'Select meeting schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
      ),
    );

    if (result != null) {
      setState(() {
        tempOnTime = result;
      });
    }
  }

  void _offTimePickerSheet(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        minuteInterval: 5,
        sheetTitle: 'Select meeting schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
      ),
    );

    if (result != null) {
      setState(() {
        tempOffTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp Setting'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ON Time'),
                Text('Time ${tempOnTime.hour}:${tempOnTime.minute}'),
                ElevatedButton(
                  onPressed: () => _onTimePickerSheet(context),
                  child: Text('Set On Time'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Off Time'),
                Text('Time ${tempOffTime.hour}:${tempOffTime.minute}'),
                ElevatedButton(
                  onPressed: () => _offTimePickerSheet(context),
                  child: Text('Set Off Time'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton( child: Text('확인'),onPressed: (){
                  var options = {
                    'ctrl':1,
                    'onTime': tempOnTime,
                    'offTime': tempOffTime
                  };
                  context.read<SmartmirrorData>().moduleOnController('tempcontroller', options);
                  Navigator.pop(context);
                }),
                ElevatedButton( child: Text('취소'),onPressed: (){
                  Navigator.pop(context);
                })
              ],
            )

          ],
        ),
      ),
    );
  }
}
