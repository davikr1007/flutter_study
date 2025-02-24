import 'package:flutter/material.dart';
import 'helper.dart';
import 'dart:async';
import 'blocks/block.dart';
import 'blocks/alive_point.dart';
import 'score_display.dart';
import 'user_input.dart';
import 'settings.dart';



class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<StatefulWidget> createState() => _Game();
}

class _Game extends State<Game> {
  LastButtonPressed performAction = LastButtonPressed.none;
  late Block currentBlock;
  List<AlivePoint> alivePoints = <AlivePoint>[];
  int score = 0;
  var settings = Settings();

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void onActionButtonPressed(LastButtonPressed newAction) {
    setState(() {
      performAction = newAction;
    });
  }

  void startGame() {
    setState(() {
      currentBlock = getRandomBlock();
    });

    settings.timer = Timer.periodic(
      Duration(milliseconds: settings.gameSpeed),
      onTimeTick,
    );
  }

  void chechForUserInput() {
    if (performAction != LastButtonPressed.none) {
      setState(() {
        switch (performAction) {
          case LastButtonPressed.left:
            currentBlock.move(MoveDir.left);
            break;
          case LastButtonPressed.right:
            currentBlock.move(MoveDir.right);
            break;
          case LastButtonPressed.rotateLeft:
            currentBlock.rotateLeft();
            break;
          case LastButtonPressed.rotateRight:
            currentBlock.rotateRight();
            break;
          default:
            break;
        }

        performAction = LastButtonPressed.none;
      });
    }
  }

  void saveOldBlock() {
    for (var point in currentBlock.points) {
      AlivePoint newPoint = AlivePoint(point.x, point.y, currentBlock.color);
      setState(() {
        alivePoints.add(newPoint);
      });
    }
  }

  bool isAboweOldBlock() {
    bool retVal = false;
    for (var oldPoint in alivePoints) {
      if (oldPoint.checkIfPointsCollide(currentBlock.points)) {
        retVal = true;
      }
    }

    return retVal;
  }

  void removeRow(int row) {
    setState(() {
      alivePoints.removeWhere((point) => point.y == row);

      for (var point in alivePoints) {
        if (point.y < row) {
          point.y += 1;
        }
      }

      score += 1;
    });
  }

  void removeFullRows() {
    for (int currentRow = 0; currentRow < settings.boardHeight; currentRow++) {
      //loop through all rows (top to bottom)
      int counter = 0;
      for (var point in alivePoints) {
        if (point.y == currentRow) {
          counter++;
        }
      }

      if (counter >= settings.boardWidth) {
        //remove current row
        removeRow(currentRow);
      }
    }
  }

  bool playerLost() {
    bool retVal = false;

    for (var point in alivePoints) {
      if (point.y <= 0) {
        retVal = true;
      }
    }

    return retVal;
  }

@override
void dispose() {
  settings.timer?.cancel(); // 타이머가 존재하면 취소
  super.dispose();
}

  void onTimeTick(Timer time) {
    if (!mounted) return; 
    if (playerLost()) return;

    //remove full rows
    removeFullRows();

    //check if tile is already at the bottom
    if (currentBlock.isAtBottom() || isAboweOldBlock()) {
      //save the block
      saveOldBlock();

      //spawn new block
      setState(() {
        currentBlock = getRandomBlock();
      });
    } else {
      setState(() {
        currentBlock.move(MoveDir.down);
      });
      chechForUserInput();
    }
  }

  Widget drawTetrisBlocks() {
    List<Positioned> visiblePoints = <Positioned>[];

    //currentBlock
    for (var point in currentBlock.points) {
      visiblePoints.add(
        Positioned(
          left: point.x * settings.pointSize,
          top: point.y * settings.pointSize,
          child: getTetrisPoint(currentBlock.color),
        ),
      );
    }

    //old blocks
    for (var point in alivePoints) {
      visiblePoints.add(
        Positioned(
          left: point.x * settings.pointSize,
          top: point.y * settings.pointSize,
          child: getTetrisPoint(point.color),
        ),
      );
    }

    return Stack(children: visiblePoints);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: Container(
            width: settings.pixelWidth,
            height: settings.pixelHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: (playerLost() == false)
                ? drawTetrisBlocks()
                : getGameOverText(score),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ScoreDisplay(score),
            UserInput(onActionButtonPressed),
          ],
        )
      ],
    );
  }
}