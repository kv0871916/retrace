import 'package:flutter/material.dart';

BoxShadow boxshadow({
  required BuildContext context,
  required Color color,
  double? withOpacity,
  double? blurRadius,
  double? x,
  double? y,
}) {
  return BoxShadow(
    offset: Offset(x ?? 2, y ?? 2),
    color: Colors.lightBlueAccent.withOpacity(withOpacity ?? 0.40),
    blurRadius: blurRadius ?? 7.0,
  );
}
