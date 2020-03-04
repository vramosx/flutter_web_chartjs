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
          title: const Text('flutter_web_chartjs'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ChartJS(
              id: 'evolution-chart',
              config: ChartConfig(
                  options: ChartOptions(
                      responsive: true,
                      layout: ChartLayout(
                          padding: EdgeInsets.all(20)),
                      legend: ChartLegend(display: false),
                      scales: ChartScales(yAxes: [
                        ChartAxis(
                            ticks: ChartTicks(
                                max: 250,
                                format: 'R\$ {value}'))
                      ], xAxes: [
                        ChartAxis(
                            gridLines: ChartGridLines(display: false),
                            ticks: ChartTicks(maxTicksLimit: 20))
                      ])),
                  type: ChartType.line,
                  data: ChartData(
                      datasets: [
                        ChartDataset(
                          borderColor: Colors.blueAccent.withOpacity(0.7),
                          backgroundColor: LinearGradient(colors: [
                            Colors.blueAccent.withOpacity(0.6),
                            Colors.blueAccent.withOpacity(0.0)
                          ], stops: [
                            0,
                            1
                          ]),
                          fill: ChartDatasetFill.start,
                          data: [
                            23,
                            45,
                            89,
                            12,
                            44,
                            89,
                            100
                          ],
                        ),
                      ],
                      labels: [
                        'Label1',
                        'Label2',
                        'Label3',
                        'Label4',
                        'Label5',
                        'Label6',
                        'Label7'
                      ]
                    )),
            ),
        ),
      ),
    );
  }
}
