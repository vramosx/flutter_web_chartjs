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
  List<ChartAxis> _chartxAxes;
  List<ChartData> _listChartData;
  List<List<ChartAxis>> _listChartAxes;
  final _isSelected = List.generate(5, (i) => i == 0 ? true : false);
  final chartData1 = ChartData(labels: [
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

  final chartData2 = ChartData(labels: [
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

  final chartDataLinear = ChartData(datasets: [
    ChartDataset(data: [
      {'x': 1, 'y': 22},
      {'x': 2, 'y': 34},
      {'x': 3, 'y': 56},
      {'x': 4, 'y': 78},
      {'x': 5, 'y': 90},
      {'x': 6, 'y': 123},
      {'x': 7, 'y': 98},
      {'x': 8, 'y': 110},
      {'x': 9, 'y': 125}
    ], label: 'dataset 1', backgroundColor: Colors.blue.withOpacity(0.4)),
    ChartDataset(
        data: [
          {'x': 1, 'y': 15},
          {'x': 2, 'y': 23},
          {'x': 3, 'y': 56},
          {'x': 4, 'y': 95},
          {'x': 5, 'y': 44},
          {'x': 6, 'y': 54},
          {'x': 7, 'y': 88},
          {'x': 8, 'y': 1},
        ],
        label: 'dataset 2',
        backgroundColor: LinearGradient(colors: [
          Colors.green.withOpacity(0.4),
          Colors.green.withOpacity(0)
        ], stops: [
          0,
          1
        ])),
  ]);

  final chartDataTime = ChartData(datasets: [
    ChartDataset(data: [
      {'x': '2020-1-1', 'y': 22},
      {'x': '2020-2-1', 'y': 34},
      {'x': '2020-3-1', 'y': 56},
      {'x': '2020-4-1', 'y': 78},
      {'x': '2020-5-1', 'y': 90},
      {'x': '2020-6-1', 'y': 123},
      {'x': '2020-7-1', 'y': 98},
      {'x': '2020-8-1', 'y': 110},
      {'x': '2020-9-1', 'y': 125}
    ], label: 'dataset 1', backgroundColor: Colors.blue.withOpacity(0.4)),
    ChartDataset(
        data: [
          {'x': '2020-1-1', 'y': 15},
          {'x': '2020-2-1', 'y': 23},
          {'x': '2020-3-1', 'y': 56},
          {'x': '2020-4-1', 'y': 95},
          {'x': '2020-5-1', 'y': 44},
          {'x': '2020-6-1', 'y': 54},
          {'x': '2020-7-1', 'y': 88},
          {'x': '2020-8-1', 'y': 1},
        ],
        label: 'dataset 2',
        backgroundColor: LinearGradient(colors: [
          Colors.green.withOpacity(0.4),
          Colors.green.withOpacity(0)
        ], stops: [
          0,
          1
        ])),
  ]);

  final chartDataLogarithm = ChartData(datasets: [
    ChartDataset(data: [
      {'x': 1, 'y': 22},
      {'x': 2, 'y': 34},
      {'x': 3, 'y': 56},
      {'x': 4, 'y': 78},
      {'x': 5, 'y': 90},
      {'x': 6, 'y': 123},
      {'x': 7, 'y': 98},
      {'x': 8, 'y': 110},
      {'x': 9, 'y': 125}
    ], label: 'dataset 1', backgroundColor: Colors.blue.withOpacity(0.4)),
    ChartDataset(
        data: [
          {'x': 1, 'y': 15},
          {'x': 2, 'y': 23},
          {'x': 3, 'y': 56},
          {'x': 4, 'y': 95},
          {'x': 5, 'y': 44},
          {'x': 6, 'y': 54},
          {'x': 7, 'y': 88},
          {'x': 8, 'y': 1},
        ],
        label: 'dataset 2',
        backgroundColor: LinearGradient(colors: [
          Colors.green.withOpacity(0.4),
          Colors.green.withOpacity(0)
        ], stops: [
          0,
          1
        ])),
  ]);

  List<ChartAxis> chartxAxes1 = [
    ChartAxis(
      type: ChartCartesianAxisType.category,
    )
  ];

  // By default type = ChartAxisType.category
  List<ChartAxis> chartxAxes2 = [ChartAxis()];

  List<ChartAxis> chartxAxesLinear = [
    ChartAxis(
      type: ChartCartesianAxisType.linear,
    )
  ];

  List<ChartAxis> chartxAxesTime = [
    ChartAxis(
      type: ChartCartesianAxisType.time,
      distribution: ChartScaleDistribution.series,
      bounds: ChartScaleBounds.data,
      time: ChartAxisTime(
        displayFormats: ChartDisplayFormats(
          month: 'MMM YY',
        ),
        isoWeekday: false,
        parser: 'YYYY-MM-DD',
        round: ChartAxisTimeUnit.month,
        tooltipFormat: 'MMM',
        unit: ChartAxisTimeUnit.month,
        minUnit: ChartAxisTimeUnit.month,
        stepSize: 2,
      )
    )
  ];

  List<ChartAxis> chartxAxesLogarithm = [
    ChartAxis(
      type: ChartCartesianAxisType.logarithmic,
    )
  ];

  @override
  void initState() {
    super.initState();
    _listChartData = [
      chartData1,
      chartData2,
      chartDataLinear,
      chartDataTime,
      chartDataLogarithm
    ];
    _listChartAxes = [
      chartxAxes1,
      chartxAxes2,
      chartxAxesLinear,
      chartxAxesTime,
      chartxAxesLogarithm
    ];
    _chartData = chartData1;
    _chartxAxes = chartxAxes1;
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
                          animationConfiguration: ChartAnimationConfiguration(
                            duration: Duration(milliseconds: 1200),
                            easing: ChartEasing.easeOutQuart,
                          ),
                          scales: ChartScales(
                            xAxes: _chartxAxes,
                          ),
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
                child: ToggleButtons(
                    isSelected: _isSelected,
                    children: [
                      Container(
                          width: 120,
                          child: Center(child: Text('Axis: Category 1'))),
                      Container(
                          width: 120,
                          child: Center(child: Text('Axis: Category 2'))),
                      Container(
                          width: 120,
                          child: Center(child: Text('Axis: Linear'))),
                      Container(
                          width: 120, child: Center(child: Text('Axis: Time'))),
                      Container(
                          width: 120,
                          child: Center(child: Text('Axis: Logarithm'))),
                    ],
                    onPressed: (index) {
                      setState(() {
                        for (var buttonIndex = 0;
                            buttonIndex < _isSelected.length;
                            buttonIndex++)
                          _isSelected[buttonIndex] = buttonIndex == index;
                        _chartData = _listChartData[index];
                        _chartxAxes = _listChartAxes[index];
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
