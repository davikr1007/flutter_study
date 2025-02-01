import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  print("pressed Play");
                },
                style: ElevatedButton.styleFrom(
                  // 여기서 색상 지정
                  backgroundColor: Colors
                      .red, // Flutter 2.0 ~ 3.0 이후로는 "primary" 대신 "backgroundColor" 사용
                  // foregroundColor: Colors.white, // 글자나 아이콘 색
                ),
                child: Icon(Icons.play_arrow)),
            ElevatedButton(
                onPressed: () {
                  print("pressed Play2");
                },
                style: ElevatedButton.styleFrom(
                  // 여기서 색상 지정
                  backgroundColor: Colors
                      .red, // Flutter 2.0 ~ 3.0 이후로는 "primary" 대신 "backgroundColor" 사용
                  // foregroundColor: Colors.white, // 글자나 아이콘 색
                ),
                child: Icon(Icons.play_circle_outline))
          ],
        ));
  }
}
