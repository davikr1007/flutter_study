import 'point.dart';
import 'package:flutter/material.dart';

class AlivePoint extends Point {
  //int x; -> defint Point class
  //int y; -> defint Point class

  Color color;

  AlivePoint(super.x, super.y, Color col)
      : color = col;

  //AlivePoint(int x, int y, this.color) : super(x,y);

  bool checkIfPointsCollide(List<Point> pointList) {
    bool retVal = false;

    for (var pointToCheck in pointList) {
      if (pointToCheck.x == x && pointToCheck.y == y - 1) {
        retVal = true;
      }
    }

    return retVal;
  }
}
