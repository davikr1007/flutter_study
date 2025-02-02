import 'package:flutter/material.dart';
import 'main.dart';
import 'menu_button.dart';

import 'settings.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var settings = Settings();
  GameSpeed currentSpeed = GameSpeed.speed1x;

  void changeGameSpeed() {
    if (currentSpeed == GameSpeed.speed1x) {
      setState(() {
        currentSpeed = GameSpeed.speed2x;
      });
    } else if (currentSpeed == GameSpeed.speed2x) {
      setState(() {
        currentSpeed = GameSpeed.speed3x;
      });
    } else if (currentSpeed == GameSpeed.speed3x) {
      setState(() {
        currentSpeed = GameSpeed.speed1x;
      });
    }
  }

  String getGameSpeed(){
    if(currentSpeed == GameSpeed.speed1x){
      return '1';
    }
    else if(currentSpeed == GameSpeed.speed2x){
      return '2';
    }
    else if(currentSpeed == GameSpeed.speed3x){
      return '3';
    } else {
      return '1';
    }
  }

  void onPlayClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    settings.setupPlayingField(screenWidth, screenHeight);

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tetris',
            style: TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 8.0,
                    offset: Offset(2.0, 2.0),
                  )
                ]),
          ),
          MenuButton(onPlayClicked),
          SizedBox(
            height: 40,
            width: 160,
            child: ElevatedButton(
              onPressed: changeGameSpeed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: Text('Game Speed: x${getGameSpeed()}'),
            ),
          ),
        ],
      ),
    );
  }
}