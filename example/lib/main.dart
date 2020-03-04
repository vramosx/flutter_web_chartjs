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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ChartJS(
              id: 'line-example',
              config: ChartConfig(
                type: ChartType.line,
                options: ChartOptions(
                  tooltip: ChartTooltip(
                    intersect: false,
                    mode: ChartTooltipMode.isIndex,
                    callbacks: ChartCallbacks(
                      label: (tooltip) {
                        return 'R\$ ${tooltip.value}';
                      }
                    )
                  )
                ),
                data: ChartData(
                  labels: [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September'
                  ],
                  datasets: [
                    ChartDataset(
                      data: [
                        15,
                        23,
                        56,
                        95,
                        44,
                        54,
                        88,
                        12
                      ],
                      label: 'dataset 1',
                      backgroundColor: Colors.blue.withOpacity(0.4)
                    ),
                    ChartDataset(
                      data: [
                        12,
                        88,
                        54,
                        44,
                        56,
                        23,
                        15,
                        12
                      ],
                      label: 'dataset 2',
                      backgroundColor: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.4),
                          Colors.green.withOpacity(0)
                        ],
                        stops: [
                          0,
                          1
                        ]
                      )
                    ),
                  ]
                )
              ),
            ),
        ),
      ),
    );
  }
}
