import 'point.dart';
import 'block.dart';
import 'package:flutter/material.dart';

//  -
// ---
class TBlock extends Block {
  TBlock(int width)
      : super(
          // 임시 값으로 초기화하고, 생성자 본문에서 재설정할 수 있습니다.
          rotationCenter: Point(0, -1),
          color: Colors.cyanAccent,
        ) {
    points[0] = Point((width / 2 - 1).floor(), 0);
    points[1] = Point((width / 2 + 0).floor(), 0);
    points[2] = Point((width / 2 + 1).floor(), 0);
    points[3] = Point((width / 2 + 0).floor(), -1);

    rotationCenter = points[1];
    color = Colors.orange;
  }
}
