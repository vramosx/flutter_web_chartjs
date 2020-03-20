import 'package:flutter/material.dart';
import 'package:flutter_web_chartjs/chartjs.models.dart';
import 'package:flutter_web_chartjs/chartjs.wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Row(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    color: Colors.orange[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 300,
                width: 300,
                child: ChartOne()),
            Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 300,
                width: 300,
                child: ChartTwo()),
          ],
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class ChartOne extends StatefulWidget {
  @override
  _ChartOne createState() => _ChartOne();
}

class _ChartOne extends State<ChartOne> {
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
    var chartJS = ChartJS(
      id: 'line-example',
      config: ChartConfig(
          type: ChartType.line,
          options: ChartOptions(
              title: ChartTitle(display: true, text: "Chart 1"),
              tooltip: ChartTooltip(
                  intersect: false,
                  mode: ChartTooltipMode.isIndex,
                  callbacks: ChartCallbacks(label: (tooltip) {
                    return 'R\$ ${tooltip.value}';
                  }))),
          data: _chartData),
    );
    return chartJS;
  }
}

class ChartTwo extends StatefulWidget {
  @override
  _ChartTwo createState() => _ChartTwo();
}

class _ChartTwo extends State<ChartTwo> {
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
    var chartJS = ChartJS(
      id: 'charttwo',
      config: ChartConfig(
          type: ChartType.line,
          options: ChartOptions(
              title: ChartTitle(display: true, text: "Chart 2"),
              tooltip: ChartTooltip(
                  intersect: false,
                  mode: ChartTooltipMode.isIndex,
                  callbacks: ChartCallbacks(label: (tooltip) {
                    return 'R\$ ${tooltip.value}';
                  }))),
          data: _chartData),
    );
    return chartJS;
  }
}
