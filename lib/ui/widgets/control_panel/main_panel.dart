
import 'package:age_processor/ui/screens/main_screen.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:age_processor/ui/widgets/components/buttons/black_button.dart';
import 'package:age_processor/ui/widgets/components/buttons/stop_button.dart';
import 'package:flutter/cupertino.dart';

class MainPanel extends StatelessWidget {

  final void Function(RecordingStatus) onTap;

  MainPanel({this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BlackButton(
          child: Center(child: StopButton(
            onTap: () => onTap(RecordingStatus.INITIAL),
          ))
        ),
        GestureDetector(
          onTap: () => onTap(RecordingStatus.PLAYING),
          child: BlackButton(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Container(
              width: 17,
              height:17,
              child: Image.asset("assets/images/play_btn.png")
            ),
            Text("00:00", style: CustomTextStyle.dateTitle)
          ],
          ))
        )),
        BlackButton(
          child: GestureDetector(
            onTap: () => onTap(RecordingStatus.SENDING),
            child: Center(child: Text("OK", style: CustomTextStyle.okBtn)))
        )
      ],
    );
  }

}