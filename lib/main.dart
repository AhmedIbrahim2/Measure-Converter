import 'package:flutter/material.dart';
import 'package:flutter_application_8/measure.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController p = TextEditingController();
  double _nfrom = 0;
  String? _startMeasure;
  String? _convertedMeasure;
  double _result = 0;
  String _resultMessage = '';
  @override
  Widget build(BuildContext context) {
    double sizex = MediaQuery.of(context).size.width;
    double sizey = MediaQuery.of(context).size.height;
    final TextStyle inputstyle = TextStyle(
      fontSize: 20,
      color: Colors.blue[900],
    );
    final Spacer = Padding(padding: EdgeInsets.only(bottom: sizey / 50));

    final List<String> _measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds',
      'ounces',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Measure Converter",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: sizex,
        padding: EdgeInsets.all(sizex / 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Value',
                style: inputstyle,
              ),
              Spacer,
              TextField(
                style: inputstyle,
                decoration: InputDecoration(
                    hintText: 'please insert a number to be measured '),
                onChanged: (text) {
                  setState(() {
                    _nfrom = double.parse(text);
                  });
                },
              ),
              Spacer,
              Text(
                "From",
                style: inputstyle,
              ),
              Spacer,
              DropdownButton(
                  style: inputstyle,
                  isExpanded: true,
                  value: _startMeasure,
                  items: _measures.map((e) {
                    return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: inputstyle,
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value!.toString();
                    });
                  }),
              Spacer,
              Text(
                "To",
                style: inputstyle,
              ),
              Spacer,
              DropdownButton(
                  style: inputstyle,
                  isExpanded: true,
                  value: _convertedMeasure,
                  items: _measures.map((e) {
                    return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: inputstyle,
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _convertedMeasure = value!.toString();
                    });
                  }),
              Spacer,
              ElevatedButton(
                  onPressed: () {
                    converts();
                  },
                  child: Text(
                    "Convert",
                    style: inputstyle,
                  )),
              Spacer,
              Text(
                _resultMessage,
                style: inputstyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  void converts() {
    setState(() {
      if (_startMeasure!.isEmpty || _convertedMeasure!.isEmpty || _nfrom == 0) {
        print(_startMeasure);
        print(_convertedMeasure);
        print(_nfrom);
        return;
      }
      var c = conversion();
      double result = c.convert(_nfrom, _startMeasure!, _convertedMeasure!);

      _result = result;
      print(_resultMessage);

      if (result == 0) {
        _resultMessage = 'this conversion can\'t be performed';
      } else {
        _resultMessage =
            '${_nfrom.toString()}  $_startMeasure are ${_result.toString()} $_convertedMeasure  ';
      }
    });
  }
}
