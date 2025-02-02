import 'package:flutter/material.dart';
import 'settings.dart';

class ActionButton extends StatelessWidget{
  final Function onClickedFunction;
  final Icon buttonIcon;
  final LastButtonPressed nextAction;

   const ActionButton(this.onClickedFunction, this.buttonIcon, this.nextAction, {super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 60,
      width: 200,
      child: Padding(padding: EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: () {
            onClickedFunction(nextAction);
          },
          style: ElevatedButton.styleFrom(
            // 여기서 색상 지정
            backgroundColor: Colors.blue
            // foregroundColor: Colors.white, // 글자나 아이콘 색
          ),
          child: buttonIcon),
      )
    );

  }

}