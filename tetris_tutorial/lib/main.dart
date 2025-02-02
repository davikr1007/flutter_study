import 'package:flutter/material.dart';
import 'settings.dart';
import 'menu.dart';
import 'game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tetris",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown[300],
      body: Menu(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var settings = Settings();
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () async {
            settings.timer?.cancel();
            Navigator.pop(context);
          },
        ),
        title: Text('Play'),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown[300],
      body: Game(),
    );
  }
}