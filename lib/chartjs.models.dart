library flutter_web_chartjs_models;

import 'package:flutter/material.dart';
import 'package:flutter_web_chartjs/utils.dart';

/// `ChartDatasetFill` DatasetFill options:
///
/// `origin`,
/// `start`,
/// `end`,
/// `isFalse`(false)
enum ChartDatasetFill { origin, start, end, isFalse }

/// `ChartType` Type options:
///
/// `line` - A line chart is a way of plotting data points on a line. Often, it is used to show trend data, or the comparison of two data sets.
///
/// `bar` - A bar chart provides a way of showing data values represented as vertical bars. It is sometimes used to show trend data, and the comparison of multiple data sets side by side.
///
/// `radar` - A radar chart is a way of showing multiple data points and the variation between them. They are often useful for comparing the points of two or more different data sets.
///
/// `doughnut` and `pie` - Pie and doughnut charts are probably the most commonly used charts. They are divided into segments, the arc of each segment shows the proportional value of each piece of data.
///
/// `polarArea` - Polar area charts are similar to pie charts, but each segment has the same angle - the radius of the segment differs depending on the value.
///
/// `bubble` - A bubble chart is used to display three dimensions of data at the same time. The location of the bubble is determined by the first two dimensions and the corresponding horizontal and vertical axes.
///
/// `scatter` - NOT SUPPORTED by flutter_web_chartkjs
enum ChartType { line, bar, radar, doughnut, pie, polarArea, bubble }

/// `ChartSteppedLineType` SteppedLine options:
///
/// `isFalse`(false),
/// `isTrue`(true),
/// `before`,
/// `after`,
/// `middle`,
enum ChartSteppedLineType { isFalse, isTrue, before, after, middle }

/// `ChartLegendPosition` LegendPosition options:
///
/// `top`,
/// `right`,
/// `bottom`,
/// `left`
enum ChartLegendPosition { top, right, bottom, left }

/// `ChartTooltipMode` TooltipMode options:
///
/// `isIndex`(index),
/// `dataset`,
/// `point`,
/// `nearest`
///  `x`
///  `y`
enum ChartTooltipMode { isIndex, dataset, point, nearest, x, y }

/// `ChartConfig` - ChartJS config
///
/// Set the ChartJS properties and data
class ChartConfig {
  /// `type` - ChartJS config > type property.
  ///
  /// `line` - A line chart is a way of plotting data points on a line. Often, it is used to show trend data, or the comparison of two data sets.
  ///
  /// `bar` - A bar chart provides a way of showing data values represented as vertical bars. It is sometimes used to show trend data, and the comparison of multiple data sets side by side.
  ///
  /// `radar` - A radar chart is a way of showing multiple data points and the variation between them. They are often useful for comparing the points of two or more different data sets.
  ///
  /// `doughnut` and `pie` - Pie and doughnut charts are probably the most commonly used charts. They are divided into segments, the arc of each segment shows the proportional value of each piece of data.
  ///
  /// `polarArea` - Polar area charts are similar to pie charts, but each segment has the same angle - the radius of the segment differs depending on the value.
  ///
  /// `bubble` - A bubble chart is used to display three dimensions of data at the same time. The location of the bubble is determined by the first two dimensions and the corresponding horizontal and vertical axes.
  ///
  /// `scatter` - NOT SUPPORTED YET.
  ChartType type;

  /// `ChartData` - ChartJS config > data property.
  /// Set the ChartJS data.
  ChartData data;

  /// `ChartOptions` - ChartJS config > options property.
  /// Set the ChartJS options.
  ChartOptions options;

  /// `ChartConfig` - ChartJS config
  ///
  /// Set the ChartJS properties and data
  ///
  /// `type` - Choose one chart type: `line`, `bar`, `radar`, `doughnut`, `pie`, `polarArea`, `bubble`
  ChartConfig({this.type = ChartType.line, this.data, this.options});

  /// Converts ChartType to string for JSON object
  getType(ChartType type) {
    switch (type) {
      case ChartType.bar:
        return 'bar';
      case ChartType.bubble:
        return 'bubble';
      case ChartType.doughnut:
        return 'doughnut';
      case ChartType.line:
        return 'line';
      case ChartType.pie:
        return 'pie';
      case ChartType.polarArea:
        return 'polarArea';
      case ChartType.radar:
        return 'radar';
    }
  }

  /// Convert the class to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = getType(type);
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options.toJson();
    }
    return data;
  }
}

/// `ChartData` - ChartJS config > data property.
/// Set the ChartJS data.
///
/// `datasets` - `List<ChartDataset>` - List of ChartDataset with the chart data.
/// `labels` - `List<String>` - List of labels for each dataset. The length has to be equal to `datasets` length.
class ChartData {
  /// `datasets` - `List<ChartDataset>` - List of ChartDataset with the chart data.
  List<ChartDataset> datasets;

  /// `labels` - `List<String>` - List of labels for each dataset. The length has to be equal to `datasets` length.
  List<String> labels;

  ChartData({this.datasets, this.labels});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datasets != null) {
      data['datasets'] = this.datasets.map((v) => v.toJson()).toList();
    }
    data['labels'] = this.labels;
    return data;
  }
}

class ChartDataset {
  List<double> data;
  dynamic backgroundColor;
  String label;
  ChartDatasetFill fill;
  dynamic borderColor;

  ChartDataset(
      {this.data,
      this.backgroundColor,
      this.label,
      this.fill,
      this.borderColor});

  Map<String, dynamic> toJson() {
    List<String> hexColors = [];

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;

    if (this.backgroundColor.runtimeType == Color ||
        this.backgroundColor.runtimeType == MaterialColor) {
      data['backgroundColor'] = Utils.toRGBA(this.backgroundColor);
    } else if (this.backgroundColor.runtimeType == LinearGradient) {
      data['backgroundColor'] = Utils.gradientToJSon(this.backgroundColor);
    } else {
      if (this.backgroundColor != null) {
        if (this.backgroundColor.length != null) {
          for (var color in this.backgroundColor) {
            hexColors.add(Utils.toRGBA(color));
          }

          data['backgroundColor'] = hexColors;
        }
      }
    }

    data['label'] = this.label;

    if (borderColor != null) {
      if (borderColor.runtimeType == LinearGradient) {
        data['borderColor'] = Utils.gradientToJSon(this.backgroundColor);
      }

      if (borderColor.runtimeType == Color ||
          borderColor.runtimeType == MaterialColor) {
        data['borderColor'] = Utils.toRGBA(borderColor);
      }
    }

    if (fill != null) {
      switch (fill) {
        case ChartDatasetFill.start:
          data['fill'] = 'start';
          break;
        case ChartDatasetFill.end:
          data['fill'] = 'end';
          break;
        case ChartDatasetFill.origin:
          data['fill'] = 'origin';
          break;
        case ChartDatasetFill.isFalse:
          data['fill'] = false;
          break;
      }
    }

    return data;
  }
}

class ChartSteppedLine {
  ChartSteppedLineType steppedLine;
  String label;
  Color color;

  ChartSteppedLine({this.steppedLine, this.label, this.color});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.steppedLine != null) {
      switch (this.steppedLine) {
        case ChartSteppedLineType.after:
          data['steppedLine'] = 'after';
          break;
        case ChartSteppedLineType.before:
          data['steppedLine'] = 'before';
          break;
        case ChartSteppedLineType.isFalse:
          data['steppedLine'] = false;
          break;
        case ChartSteppedLineType.isTrue:
          data['steppedLine'] = true;
          break;
        case ChartSteppedLineType.middle:
          data['steppedLine'] = 'middle';
          break;
      }
    }

    if (this.label != null) {
      data['label'] = this.label;
    }

    if (this.color != null) {
      data['color'] = Utils.toRGBA(color);
    }

    return data;
  }
}

class ChartOptions {
  ChartLegend legend;
  bool responsive;
  ChartTitle title;
  ChartScales scales;
  ChartAnimationConfiguration animationConfiguration;
  ChartLayout layout;
  ChartTooltip tooltip;

  ChartOptions(
      {this.legend,
      this.responsive,
      this.title,
      this.scales,
      this.layout,
      this.tooltip,
      this.animationConfiguration});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.legend != null) {
      data['legend'] = this.legend.toJson();
    }

    if (this.title != null) {
      data['title'] = this.title;
    }

    if (this.animationConfiguration != null) {
      data['animationConfiguration'] = this.animationConfiguration.toJson();
    }

    if (this.scales != null) {
      data['scales'] = this.scales.toJson();
    }

    if (this.layout != null) {
      data['layout'] = this.layout.toJson();
    }

    if (this.tooltip != null) {
      data['tooltips'] = this.tooltip.toJson();
    }

    if (this.responsive != null) {
      data['responsive'] = this.responsive;
    }

    return data;
  }
}

class ChartTooltip {
  ChartTooltipMode mode;
  bool intersect;
  ChartCallbacks callbacks;

  ChartTooltip({this.mode, this.intersect, this.callbacks});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.mode != null) {
      switch (this.mode) {
        case ChartTooltipMode.dataset:
          data['mode'] = 'dataset';
          break;
        case ChartTooltipMode.isIndex:
          data['mode'] = 'index';
          break;
        case ChartTooltipMode.nearest:
          data['mode'] = 'nearest';
          break;
        case ChartTooltipMode.point:
          data['mode'] = 'point';
          break;
        case ChartTooltipMode.nearest:
          data['mode'] = 'nearest';
          break;
        case ChartTooltipMode.x:
          data['mode'] = 'x';
          break;
        case ChartTooltipMode.y:
          data['mode'] = 'y';
          break;
      }
    }

    if (this.intersect != null) {
      data['intersect'] = this.intersect;
    }

    return data;
  }
}

class ChartCallbacks {
  String Function(ChartTooltipItem) label;

  ChartCallbacks({this.label});
}

class ChartLayout {
  EdgeInsetsGeometry padding;

  ChartLayout({this.padding});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.padding != null) {
      var p = this.padding as EdgeInsets;
      data['padding'] = {
        "left": p.left,
        "right": p.right,
        "top": p.top,
        "bottom": p.bottom
      };
    }

    return data;
  }
}

class ChartAnimationConfiguration {
  Duration duration;
  Curve easing;

  ChartAnimationConfiguration({this.duration, this.easing});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.duration != null) {
      data['duration'] = this.duration.inMilliseconds;
    }

    if (this.easing != null) {
      data['easing'] = this.easing.toString();
    }

    return data;
  }
}

class ChartTitle {
  bool display;
  String text;

  ChartTitle({this.display, this.text});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['display'] = this.display;
    data['text'] = this.text;
    return data;
  }
}

class ChartScales {
  List<ChartAxis> xAxes = [];
  List<ChartAxis> yAxes = [];

  ChartScales({this.xAxes, this.yAxes});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.xAxes != null) {
      List<Map<String, dynamic>> _xAxes = [];

      for (var item in this.xAxes) {
        _xAxes.add(item.toJson());
      }

      data['xAxes'] = xAxes;
    }

    if (this.yAxes != null) {
      List<Map<String, dynamic>> _yAxes = [];

      for (var item in this.yAxes) {
        _yAxes.add(item.toJson());
      }

      data['yAxes'] = _yAxes;
    }
    return data;
  }
}

class ChartAxis {
  ChartGridLines gridLines;
  ChartTicks ticks;
  bool stacked;

  ChartAxis({this.gridLines, this.ticks, this.stacked});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.gridLines != null) {
      data['gridLines'] = this.gridLines.toJson();
    }

    if (this.ticks != null) {
      data['ticks'] = this.ticks.toJson();
    }

    if (this.stacked != null) {
      data['stacked'] = this.stacked;
    }
    return data;
  }
}

class ChartTicks {
  int min;
  int max;
  int stepSize;
  bool autoSkip;
  int maxTicksLimit;
  String format;

  ChartTicks(
      {this.min,
      this.max,
      this.stepSize,
      this.autoSkip,
      this.maxTicksLimit,
      this.format});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.min != null) data['min'] = this.min;
    if (this.max != null) data['max'] = this.max;
    if (this.stepSize != null) data['stepSize'] = this.stepSize;
    if (this.autoSkip != null) data['autoSkip'] = this.autoSkip;
    if (this.maxTicksLimit != null) data['maxTicksLimit'] = this.maxTicksLimit;
    if (this.format != null) data['format'] = this.format;

    return data;
  }
}

class ChartGridLines {
  bool display;
  bool drawBorder;
  bool drawOnChartArea;
  bool drawTicks;

  ChartGridLines(
      {this.display, this.drawBorder, this.drawOnChartArea, this.drawTicks});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['display'] = this.display;
    data['drawBorder'] = this.drawBorder;
    data['drawOnChartArea'] = this.drawOnChartArea;
    data['drawTicks'] = this.drawTicks;
    return data;
  }
}

class ChartLegend {
  ChartLegendPosition position;
  bool display;

  ChartLegend({this.position, this.display});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    switch (this.position) {
      case ChartLegendPosition.bottom:
        data['position'] = 'bottom';
        break;
      case ChartLegendPosition.left:
        data['position'] = 'left';
        break;
      case ChartLegendPosition.right:
        data['position'] = 'right';
        break;
      case ChartLegendPosition.top:
        data['position'] = 'top';
        break;
    }

    if (this.display != null) {
      data['display'] = this.display;
    }

    return data;
  }
}

class ChartTooltipItem {
  String xLabel;
  num yLabel;
  String label;
  String value;
  int index;
  int datasetIndex;
  double x;
  double y;

  ChartTooltipItem(
      {this.xLabel,
      this.yLabel,
      this.label,
      this.value,
      this.index,
      this.datasetIndex,
      this.x,
      this.y});

  ChartTooltipItem.fromJson(Map<String, dynamic> json) {
    xLabel = json['xLabel'];
    yLabel = json['yLabel'];
    label = json['label'];
    value = json['value'];
    index = json['index'];
    datasetIndex = json['datasetIndex'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xLabel'] = this.xLabel;
    data['yLabel'] = this.yLabel;
    data['label'] = this.label;
    data['value'] = this.value;
    data['index'] = this.index;
    data['datasetIndex'] = this.datasetIndex;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }

  String toString() =>
      "{ xLabel: $xLabel, yLabel: $yLabel, label: $label, value: $value, index: $index, datasetIndex: $datasetIndex, x: $x, y: $y }";
}
