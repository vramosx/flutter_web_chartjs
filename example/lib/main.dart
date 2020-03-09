import 'package:flutter/material.dart';
import 'package:flutter_web_chartjs/chartjs.models.dart';
import 'package:flutter_web_chartjs/chartjs.wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ChartData _chartData;
  var chartData1 = ChartData(labels: [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September'
  ], datasets: [
    ChartDataset(
        data: [15, 23, 56, 95, 44, 54, 88, 12],
        label: 'dataset 1',
        backgroundColor: Colors.blue.withOpacity(0.4)),
    ChartDataset(
        data: [12, 88, 54, 44, 56, 23, 15, 12],
        label: 'dataset 2',
        backgroundColor: LinearGradient(colors: [
          Colors.green.withOpacity(0.4),
          Colors.green.withOpacity(0)
        ], stops: [
          0,
          1
        ])),
  ]);

  var chartData2 = ChartData(labels: [
    'October',
    'November',
    'December',
    'January',
    'February',
    'March',
    'July',
    'August',
    'September'
  ], datasets: [
    ChartDataset(
        data: [22, 34, 56, 78, 90, 123, 98, 110, 125],
        label: 'dataset 1',
        backgroundColor: Colors.blue.withOpacity(0.4)),
    ChartDataset(
        data: [15, 23, 56, 95, 44, 54, 88, 1],
        label: 'dataset 2',
        backgroundColor: LinearGradient(colors: [
          Colors.green.withOpacity(0.4),
          Colors.green.withOpacity(0)
        ], stops: [
          0,
          1
        ])),
  ]);

  @override
  void initState() {
    super.initState();
    _chartData = chartData1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_web_chartjs'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ChartJS(
                  id: 'line-example',
                  config: ChartConfig(
                      type: ChartType.line,
                      options: ChartOptions(
                          tooltip: ChartTooltip(
                              intersect: false,
                              mode: ChartTooltipMode.isIndex,
                              callbacks: ChartCallbacks(label: (tooltip) {
                                return 'R\$ ${tooltip.value}';
                              }))),
                      data: _chartData),
                ),
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                    if (_chartData == chartData1) {
                      this.setState(() {
                        _chartData = chartData2;
                      });
                      return;
                    }
                    this.setState(() {
                      _chartData = chartData1;
                    });
                  },
                  child: Text("Change data!"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
