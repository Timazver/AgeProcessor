
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
      width: 300,
      height: 260,
      decoration: BoxDecoration(
        gradient: CustomColors.textBlockGradient,
        border: Border.all(style: BorderStyle.solid, color: Colors.white, width: 4),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
        children: [
          Text("For testing you can use following text", style: CustomTextStyle.textBlockTitle),
          Text("push the button below and read it outloud", style: CustomTextStyle.textBlockSubtitle),
          SizedBox(height: 20),
          Text("Что ж делает Мария?\nГде она, Иосифа печальная супруга?\nВ своем саду, печальных дум полна,\nПроводит час невинного досуга\nИ снова ждет пленительного сна.\nС ее души не сходит образ милый,\nК архангелу летит душой унылой.", style: CustomTextStyle.textBlockTitle)
        ]
      )
    )));
  }

}