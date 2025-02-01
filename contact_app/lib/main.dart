import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('안녕') // 텍스트 입력
      // home: Icon(Icons.star) // 아이콘 입력
      // home: Image.asset('images/profile.png') //assets/images/profile.png 하면 오류 남
      // home: SizedBox()
      // home: Center(
      //   child: Container(
      //   width: 50, //flutter 사이즈 단위 LP, 픽셀 아님
      //   height: 50,
      //   color: Colors.red
      // ),
      // )
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Column(
          children: [
            Divider(
              thickness: 1,        // 선 두께
              color: Colors.grey,   // 선 색상
            ),
            // 그 아래로 다른 위젯들
            Expanded(
              child: Container(
                // 실제 내용들
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Text('data')
        ),
      )
    );
  }
}