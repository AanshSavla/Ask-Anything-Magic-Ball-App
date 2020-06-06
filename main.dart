import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: MagicBall(),
      ),
    );

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;
  var _question = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _question,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lime),
                ),
                hintText: "Yes/No Type question and tap."),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          child: Center(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _question.clear();
                  ballNumber = Random().nextInt(5) + 1;
                });
              },
              child: Image.asset("images/ball$ballNumber.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class MagicBall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Center(
          child: Text(
            "Ask Me Anything",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.cyan[200],
            ),
          ),
        ),
        backgroundColor: Colors.indigo[400],
      ),
      body: BallPage(),
    );
  }
}
