import 'package:flutter/material.dart';

class Utils {
  static String toHex(Color c, {bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${c.red.toRadixString(16).padLeft(2, '0')}'
      '${c.green.toRadixString(16).padLeft(2, '0')}'
      '${c.blue.toRadixString(16).padLeft(2, '0')}';

  static String toRGBA(Color c) => 'rgba(${c.red.toString()},'
      '${c.green.toString()},'
      '${c.blue.toString()},'
      '${c.opacity.toStringAsFixed(1)})';

  static Map<dynamic, dynamic> gradientToJSon(LinearGradient linearGradient) {
    var c = linearGradient;
    var gradient = [];

    c.stops.asMap().forEach((key, value) {
      gradient.add({"stop": value, "color": Utils.toRGBA(c.colors[key])});
    });

    return {"isGradient": true, "gradient": gradient};
  }
}
