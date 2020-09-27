import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Grade Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController pointedEarnedTextField = new TextEditingController();
  TextEditingController totalPointsTextField = new TextEditingController();
  TextEditingController letterGradeTextField = new TextEditingController();
  TextEditingController scoreTextField = new TextEditingController();

  void _calcGrade() {
    setState(() {
      double pointsEarned = double.parse(pointedEarnedTextField.text);
      double totalPoints = double.parse(totalPointsTextField.text);
      double score = (pointsEarned / totalPoints) * 100;
      String letterGrade = getLetterGrade(score);
      letterGradeTextField.text = letterGrade;
      scoreTextField.text = score.toStringAsFixed(1);
    });
  }

  String getLetterGrade(double score) {
    if (score > 89.0) {
      return "A";
    } else if (score > 79.0) {
      return "B";
    } else if (score > 69.0) {
      return "C";
    } else if (score > 59.0) {
      return "D";
    } else {
      return "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter Score:', style: TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(20.0),
              width: 350.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Flexible(
                    child: TextFormField(
                      controller: pointedEarnedTextField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Points Earned',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Text('/', style: TextStyle(fontSize: 30)),
                  const SizedBox(width: 20.0),
                  new Flexible(
                    child: TextFormField(
                      controller: totalPointsTextField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Total Points',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: _calcGrade,
              child: const Text('Submit', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 50),
            Text('Letter Grade:', style: TextStyle(fontSize: 30)),
            Container(
              margin: const EdgeInsets.all(20.0),
              width: 75.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Flexible(
                    child: TextField(
                      controller: letterGradeTextField,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Grade',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text('Score:', style: TextStyle(fontSize: 30)),
            Container(
              margin: const EdgeInsets.all(20.0),
              width: 100.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Flexible(
                    child: TextField(
                      controller: scoreTextField,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Score (%)',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
