import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'custom Bar chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _answer1 = 0;
  int _answer2 = 0;
  Color postitiveColor = new Color(0xFFEF0078);
  Color negetiveColor = new Color(0xFFFFFFFF);
  Color postitiveColor2 = new Color(0xFFFF9100);
  TextEditingController answer1Controller = new TextEditingController();
  TextEditingController answer2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 100,
            child: Chart(
              heightContainer: 200,
              numOfQuestions: 20,
              numOfAnswer: _answer1,
              negetiveColor: negetiveColor,
              positiveColor: postitiveColor,
              name: "Bar chart 1",
            ),
          ),
          Positioned(
            top: 30,
            left: 220,
            child: Chart(
              heightContainer: 200,
              numOfQuestions: 20,
              numOfAnswer: _answer2,
              negetiveColor: negetiveColor,
              positiveColor: postitiveColor2,
              name: "Bar chart 2",
            ),
          ),
          Positioned(
            top: 300,
            left: 30,
            child: Container(
              width: 120.0,
              child: TextField(
                controller: answer1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bar chart 1    ',
                    hintText: '  Bar chart 1  ',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff8592ad),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 170,
            child: Container(
              width: 120.0,
              child: TextField(
                controller: answer2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bar chart 2    ',
                    hintText: '  Bar chart 2  ',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _answer1 = int.parse(answer1Controller.text);
            _answer2 = int.parse(answer2Controller.text);
            // _answer1++;
            // _answer2++;
          });
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class Chart extends StatefulWidget {
  double heightContainer;
  int numOfQuestions;
  int numOfAnswer;
  Color positiveColor;
  Color negetiveColor;
  String name;
  Chart(
      {this.heightContainer,
      this.numOfAnswer,
      this.numOfQuestions,
      this.positiveColor,
      this.negetiveColor,
      this.name});

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    double questionsunit = widget.heightContainer / widget.numOfQuestions;
    double percentageheght = questionsunit * widget.numOfAnswer;
    return Column(
      children: <Widget>[
        Container(
          height: widget.heightContainer + 4.0,
          width: 30.0,
          decoration: BoxDecoration(
              color: widget.negetiveColor,
              border: Border.all(color: Colors.black, width: 2.0)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              AnimatedContainer(
                width: 26,
                height: percentageheght,
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                color: widget.positiveColor,
              ),
            ],
          ),
        ),
        Text(
          widget.name,
          style: TextStyle(color: Colors.black, fontSize: 20),
        )
      ],
    );
  }
}
