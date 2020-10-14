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
  String errorMessage = "";
  String grade = "";
  TextEditingController scoreTextField = new TextEditingController();
  TextEditingController totalPointsTextField = new TextEditingController();
  bool _isTriage = false;

  void _calcGrade() {
    double score = 0;
    setState(() {
      errorMessage = "";
      score = double.parse(scoreTextField.text);
      grade = getLetterGrade(score);
    });
  }

  String getLetterGrade(double score) {
    if (!_isTriage) {
      if (score > 100.0) {
        errorMessage =
            "Error: Score is too high, enter a value between 0 and 100.";
      } else if (score > 89.0) {
        return "A";
      } else if (score > 79.0) {
        return "B";
      } else if (score > 69.0) {
        return "C";
      } else if (score > 59.0) {
        return "D";
      } else if (score > 0.00) {
        return "F";
      } else {
        errorMessage =
            "Error: Score is too low, enter a value between 0 and 100.";
      }
    } else {
      if (score > 1) {
        errorMessage =
            "Error: Score is too high, enter a value between 0 and 1.";
      } else if (score > (17 / 18)) {
        return "A";
      } else if (score > (5 / 6)) {
        return "B";
      } else if (score > (2 / 3)) {
        return "C";
      } else if (score > (7 / 15)) {
        return "D";
      } else {
        return "F";
      }
    }
    return "";
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
            Container(
                width: 200,
                margin: const EdgeInsets.all(20.0),
                child: CheckboxListTile(
                  title: Text("Triage grading?"),
                  value: _isTriage,
                  onChanged: (newValue) {
                    setState(() {
                      _isTriage = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                )),
            Text('Enter Score:', style: TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(20.0),
              width: 100.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Flexible(
                    child: TextFormField(
                      controller: scoreTextField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Score',
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
            Text(errorMessage, style: TextStyle(fontSize: 20)),
            const SizedBox(height: 50),
            Text('Letter Grade:', style: TextStyle(fontSize: 30)),
            Text(grade,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
