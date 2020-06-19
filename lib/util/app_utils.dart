import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppUtils {

  static PublishSubject<double> percent = PublishSubject();
  
  static void showError(BuildContext context, String title, String text, {void Function() onSubmit}) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
              content: Text(text),
              actions: <Widget>[
                FlatButton(
                  child:
                      Center(child: Text("Ок", style: TextStyle(fontSize: 18))),
                  onPressed: () =>  onSubmit == null ? Navigator.of(context).pop() : onSubmit(),
                )
              ],
            )
        );
  }

}
