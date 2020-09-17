import 'package:age_processor/ui/screens/main_screen.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:age_processor/ui/widgets/control_panel/main_panel.dart';
import 'package:age_processor/ui/widgets/control_panel/process_button.dart';
import 'package:age_processor/ui/widgets/control_panel/recording_timer.dart';
import 'package:flutter/material.dart';

class ControlPanel extends StatefulWidget {

  final void Function(RecordingStatus) onTap;
  final RecordingStatus status;

  ControlPanel({this.onTap, this.status});

  @override
  State<StatefulWidget> createState() => _ControlerPanelState();

  
}

class _ControlerPanelState extends State<ControlPanel> {
  
  

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case RecordingStatus.INITIAL:
        return GestureDetector(
          onTap: () => widget.onTap(RecordingStatus.RECORDING),
          child: _buildContainerWithChild(
          child: _initialPanel()
        ));
        break;
      case RecordingStatus.RECORDING:
        return GestureDetector(
          child: _buildContainerWithChild(
          child: RecordingTimer(
            onTap: (status) => widget.onTap(status)
          )
        ));
        break;
      case RecordingStatus.SENDING:
         return ProcessButton();
        break;
      case RecordingStatus.PAUSING:
        return GestureDetector(
          child: _buildContainerWithChild(
          child: MainPanel(
            onTap: (status) => widget.onTap(status)
          )
        ));
        break;
      case RecordingStatus.COMPLETE:
        break;
      case RecordingStatus.RESUMING:
        // TODO: Handle this case.
        break;
      case RecordingStatus.PLAYING:
        return GestureDetector(
          child: _buildContainerWithChild(
          child: MainPanel(
            onTap: (status) => widget.onTap(status)
          )
        ));
        break;
    }
  }

Widget _buildContainerWithChild({Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white
      ),
      child: Center(child: child)
    );
}

Widget _initialPanel() {
    return _buildContainerWithChild(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("START RECORDING", style: CustomTextStyle.initialStatusPanelTitle),
          Text("FREE RECORDINGS TODAY: 4", style: CustomTextStyle.initialStatusPanelSubtitle),
        ]
      )
    );
  }
}