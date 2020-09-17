
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {

  final Widget child;
  final void Function() onTap;

  BlackButton({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
      width: 84,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black,
        border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 3)
      ),
      child: child
    ));
  }

}