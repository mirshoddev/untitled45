import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? _myAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200),
    );
    _myAnimation = CurvedAnimation(
        parent: _controller!, curve: Curves.easeIn
    );
    super.initState();
  }

  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animation"),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _myAnimation!,
          child: Container(
            height: 400,
            width: 400,
            child: Image(
              image: AssetImage("assets/images/img.jpg"),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller?.forward(from: 0);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
