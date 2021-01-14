
import "package:flutter/material.dart";

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String _result = "";
  String _defaultMonth="January";
  List<String> dropdownMonth= <String>[
'January',
'February',
'March',
'April',
'May',
'June',
'July',
'August',
'September',
'October',
'November',
'December'


  ];

  final TextEditingController _date = TextEditingController();
  final TextEditingController _year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Find Day"), elevation: 0.0),
        body: Center(
            child: Container(
                child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _date,
                  decoration: InputDecoration(labelText: "Enter date "),
                  keyboardType: TextInputType.number,
                )),
            Container(
              alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  value: _defaultMonth,
                  icon: Icon(Icons.arrow_drop_down),
                  elevation: 8,
                  
                  items: dropdownMonth.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(value: value,child: Text(value),);
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                    _defaultMonth=newValue;
                    });
                  },
                )

                ),
            Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: TextField(
                          controller: _year,
                          decoration: InputDecoration(labelText: "Year"),
                          keyboardType: TextInputType.number,
                        )),
                  ],
                )),
            Flexible(
              fit: FlexFit.loose,
              child: FlatButton(
                onPressed: _handleCalculation,
                child: Text("Calculate"),
                color: Colors.redAccent,
                textColor: Colors.white,
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 24.0, right: 24.0),
              ),
            ),
            Expanded(child: resultsWidget(_result))
          ],
        ))));
  }

  void _handleCalculation() {
    //d=date
    //m=month
    //y=year
    //c=century
    int F = 0;

    int d = int.parse(_date.text);
    String m = _defaultMonth;
    int M=0;
    switch (m) {
      case 'January':
        M = 1;
        break;

      case 'February':
        M = 4;
        break;
      case 'March':
        M = 4;
        break;
      case 'April':
        M = 0;
        break;
      case 'May':
        M = 2;
        break;
      case 'June':
        M = 5;
        break;
      case 'July':
        M = 0;
        break;
      case 'August':
        M = 3;
        break;
      case 'September':
        M = 6;
        break;
      case 'October':
        M = 1;
        break;
      case 'November':
        M = 4;
        break;
      case 'December':
        M = 6;
        break;
      default:
        break;
    }
    int c = int.parse(_year.text);
    int century = c;
    int C = 0;
    while (century > 100) {
      century = (century ~/ 100).toInt();
    }

    switch (century) {
      case 17:
        C = 4;
        break;
      case 18:
        C = 2;
        break;
      case 19:
        C = 0;
        break;
      case 20:
        C = -1;
        break;
      default:
        break;
    }
    int year;
    year = c % 100;

    int Q = year ~/ 4;

    int A = year + Q;
    int R = A % 7;
    int Y = R;

    int D = d % 7;

    F = (D + M + C + Y) % 7;
    var N;

    switch (F) {
      case 0:
        N = 'Staurday';
        break;
      case 1:
        N = 'Sunday';
        break;
      case 2:
        N = 'Monday';
        break;
      case 3:
        N = 'Tuesday';
        break;
      case 4:
        N = 'Wednesday';
        break;
      case 5:
        N = 'Thursday';
        break;
      case 6:
        N = 'Friday';
        break;
      default:
    }
    _result = N.toString();

    setState(() {});
  }

  Widget resultsWidget(result) {
    bool canShow = false;
    String _result = result;

    if (_result.length > 0) {
      canShow = true;
    }

    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: canShow
              ? Column(children: [
                  Text("Its",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Container(
                      child: Text(_result,
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold)))
                ])
              : Container()),
    );
  }
}
