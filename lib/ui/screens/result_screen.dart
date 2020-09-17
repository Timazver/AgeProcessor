import 'dart:async';
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:age_processor/ui/screens/main_screen.dart';
import 'package:age_processor/ui/screens/webview_screen.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:age_processor/ui/widgets/pro_sign.dart';
import 'package:age_processor/ui/widgets/result/result_text_block.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  
  ResultScreen({this.predicted_age, this.predicted_sex});

  final String predicted_sex;
  final int predicted_age;


  @override
  State<StatefulWidget> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int count = 0;
  bool isStopped = false; //
  DateTime _currentDate;
  List<String> _weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  List<String> _months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

  @override
  initState() {
    super.initState();
    _currentDate = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: ()  { 
        setState(() {
          isStopped = true;
        });
        Navigator.pop(context);
        return Future.value(true);
      },
      child: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column(children: [
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("${_weekDays[_currentDate.weekday - 1]}, ${_currentDate.day} ${_months[_currentDate.month - 1]}", style: CustomTextStyle.dateTitle),
              ProSign()
            ]),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Test your voice",
                    style: CustomTextStyle.screenTitle)),
            SizedBox(height: 20),
            Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // gradient: CustomColors.bGGradient,
                image: DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitWidth)
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(child: Container(
                height: height * 0.5,
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: CustomColors.bGGradient,
              ),
                child: Padding(padding:EdgeInsets.symmetric(horizontal: 22), child: ResultTextBlock(
              age: "${widget.predicted_age}",
              sex: widget.predicted_sex
            ),)
              ),
            )),
            SizedBox(height: 20),
            GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen())),
                    child: _buildContainerWithChild(
              color: CustomColors.blueBtn,
              height: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("TRY AGAIN", style: CustomTextStyle.tryAgainBtn)
                  ,
                  Text("FREE RECORDINGS TODAY: 3", style: CustomTextStyle.tryAgainSubtitle)
                ],
              ))
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewScreen())),
              child: _buildContainerWithChild(
                height: 40,
              child: Center(
                child: Text("SEND FEEDBACK", style: CustomTextStyle.feedBackTitle),
              ),
              color: Colors.white
            )),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 23),
              child: Center(
                child: Text("Powered by AgeProcessor AI",
                    style: CustomTextStyle.textBlockSubtitle)))
            
          ]),
        )
    ))));
  }

  Widget _buildContainerWithChild({Widget child, Color color, double height}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: color
      ),
      child: Center(child: child)
    );
  }
}