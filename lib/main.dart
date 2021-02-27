import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget CustomButton(String buttonval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25),
        onPressed: () => buttonClicked(buttonval),
        child: Text(
          "$buttonval",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String op;
  void buttonClicked(String buttonval) {
    if (buttonval == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (buttonval == "+" ||
        buttonval == "-" ||
        buttonval == "*" ||
        buttonval == "/") {
      firstnum = int.parse(texttodisplay);
      res = '';
      op = buttonval;
    } else if (buttonval == "=") {
      secondnum = int.parse(texttodisplay);
      if (op == "+") res = (firstnum + secondnum).toString();
      if (op == "-") res = (firstnum - secondnum).toString();
      if (op == "*") res = (firstnum * secondnum).toString();
      if (op == "/") res = (firstnum / secondnum).toString();
    } else {
      res = int.parse(texttodisplay + buttonval).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(18),
              alignment: Alignment.bottomRight,
              child: Text(
                "$texttodisplay",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
            Row(
              children: [
                CustomButton("7"),
                CustomButton("8"),
                CustomButton("9"),
                CustomButton("+"),
              ],
            ),
            Row(
              children: [
                CustomButton("6"),
                CustomButton("5"),
                CustomButton("4"),
                CustomButton("-")
              ],
            ),
            Row(
              children: [
                CustomButton("3"),
                CustomButton("2"),
                CustomButton("1"),
                CustomButton("*")
              ],
            ),
            Row(
              children: [
                CustomButton("C"),
                CustomButton("="),
                CustomButton("0"),
                CustomButton("/")
              ],
            )
          ],
        ));
  }
}
