import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool nightMode = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: nightMode?Colors.black:Colors.white,
      child: Center(
        child: Listener(
          onPointerDown: _OnPointerDown,
          child: Stack(children: [
            Container(
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: nightMode ? Colors.white : Colors.black),
            ),
            AnimatedPositioned(
              duration:const Duration(milliseconds: 250),
              left:nightMode?45:5,
              top: 5,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:nightMode? Colors.black:Colors.white,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void _OnPointerDown(PointerDownEvent event) {
    setState(() {
      nightMode ? nightMode = false : nightMode = true;
    });
  }
}
