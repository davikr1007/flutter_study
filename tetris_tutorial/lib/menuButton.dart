import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  Function onClickedFunction;

  MenuButton(this.onClickedFunction);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
          onPressed: () {
            onClickedFunction();
          },
          style: ElevatedButton.styleFrom(
            // 여기서 색상 지정
            backgroundColor: const Color.fromARGB(255, 207, 84, 2), // Flutter 2.0 ~ 3.0 이후로는 "primary" 대신 "backgroundColor" 사용
            // foregroundColor: Colors.white, // 글자나 아이콘 색
          ),
          child: Icon(Icons.play_arrow)),
    );
  }
}
