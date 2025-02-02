import 'point.dart';
import 'package:flutter/material.dart';
import '../settings.dart';

class Block {
  late List<Point> points;
  late Point rotationCenter;
  late Color color;

  Block({required this.rotationCenter, required this.color}) {
    points = List.generate(4, (_) => Point(0, 0));
  }

  void move(MoveDir dir) {
    switch (dir) {
      case MoveDir.left:
        if (canMoveToSide(-1)) {
          for (var p in points) {
            p.x -= 1;
          }
        }
        break;
      case MoveDir.right:
        if (canMoveToSide(1)) {
          for (var p in points) {
            p.x += 1;
          }
        }

        break;
      case MoveDir.down:
        for (var p in points) {
          p.y += 1;
        }
        break;
    }
  }

  bool canMoveToSide(int moveAmt) {
    var settings = Settings();
    bool retVal = true;

    for (var point in points) {
      if (point.x + moveAmt < 0 || point.x + moveAmt >= settings.boardWidth) {
        retVal = false;
      }
    }

    return retVal;
  }

  bool allPointsInside(){
    bool retVal = true;
    var settings = Settings();

    for (var point in points) {
      if(point.x < 0 || point.x >= settings.boardWidth){
        retVal = false;
      }
    }

    return retVal;
  }

  void rotateRight() {
    for (var point in points) {
      int x = point.x;
      point.x = rotationCenter.x - point.y + rotationCenter.y;
      point.y = rotationCenter.y + x - rotationCenter.x;
    }

    if(allPointsInside() == false){
      rotateLeft();
    }
  }

  void rotateLeft() {
    for (var point in points) {
      int x = point.x;
      point.x = rotationCenter.x + point.y - rotationCenter.y;
      point.y = rotationCenter.y - x + rotationCenter.x;
    }

    if(allPointsInside() == false){
      rotateRight();
    }
  }

  bool isAtBottom() {
    var settings = Settings();

    int lowestPoint = 0;

    for (var point in points) {
      if (point.y > lowestPoint) {
        lowestPoint = point.y;
      }
    }

    if (lowestPoint >= settings.boardHeight - 1) {
      return true;
    } else {
      return false;
    }

    //return lowestPoint >= BOARD_HEIGHT - 1;
  }
}