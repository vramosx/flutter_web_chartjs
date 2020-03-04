library flutter_web_chartjs;

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:js' as js;

import 'package:flutter_web_chartjs/chartjs.models.dart';
import 'package:flutter_web_chartjs/chartjs.wrapper.utils.dart';

class ChartJS extends StatefulWidget {
  final int width;
  final int height;
  final AlignmentGeometry alignment;
  final String id;
  final ChartConfig config;

  ChartJS(
      {Key key,
      this.width,
      this.height,
      @required this.id,
      @required this.config,
      this.alignment})
      : assert(id != null), 
        assert(config != null),
        assert(config.type != null),
        assert(config.data != null),
        super(key: key);

  @override
  _ChartJSState createState() => _ChartJSState();
}

class _ChartJSState extends State<ChartJS> {
  CanvasElement canvasElement;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      this.updateChart();
    });
  }

  @override
  void didUpdateWidget(ChartJS oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.config != widget.config) {
      this.updateChart();
    }
  }

  updateChart() {
    String _id = widget.id;

    var jsonConfig =
        widget.config != null ? widget.config.toJson() : ChartConfig().toJson();
    
    dynamic Function(dynamic, dynamic) formatTooltip;
    
    String Function(ChartTooltipItem) tooltipCallback;
    if(widget.config.options != null) {
        if(widget.config.options.tooltip.callbacks != null) {
          if(widget.config.options.tooltip.callbacks.label != null) {
            tooltipCallback = widget.config.options.tooltip.callbacks.label;
          }
        }
      }

    formatTooltip = (_tooltipItem, _data) {
      var _decode = json.decode(_tooltipItem);
      var tooltipItem = ChartTooltipItem.fromJson(_decode);

      if(tooltipCallback != null) return tooltipCallback(tooltipItem);

      return tooltipItem.value;
    }; 

    var utils = ChartJSWrapperPlugin();

    utils.showChart(
      "$_id", 
      json.encode(jsonConfig), 
      js.allowInterop(formatTooltip));
  }

  void registerContent() {
    var canvas = CanvasElement()
      ..id = widget.id
      ..width = widget.width
      ..height = widget.height;

    var chartContainer = DivElement()
      ..setAttribute(
          'style', 'width: ${widget.width}px; height: ${widget.height}px;')
      ..append(canvas);

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'ChartJS-${widget.id}', (int viewId) => chartContainer);
  }

  @override
  Widget build(BuildContext context) {
    if (canvasElement == null) {
      registerContent();
    }

    return HtmlElementView(viewType: 'ChartJS-${widget.id}');
  }
}
