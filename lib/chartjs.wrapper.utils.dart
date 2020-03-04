

@JS()
library chartjs_wrapper_utils;

import 'package:js/js.dart';

// ignore: missing_js_lib_annotation
@JS('chartJSWrapperPlugin')
class ChartJSWrapperPlugin {
  external factory ChartJSWrapperPlugin();
  external void showChart(String chartId, String config, Function(dynamic, dynamic) formatTooltip);
} 