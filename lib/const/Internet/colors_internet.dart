import 'package:flutter/material.dart';

import '../../controller/auth/auth_helper.dart';

List<Color> customcolor = [
  Colors.yellow,
  Colors.green,
  Colors.green,
  Colors.red
];
List<String> customString = ["Loading", "Online", "Offline"];

Map<Connect, Color> connectmap = {
  Connect.initial: customcolor[0],
  Connect.mobile: customcolor[1],
  Connect.wifi: customcolor[2],
  Connect.nodata: customcolor[3],
};

Map<Connect, String> connectext = {
  Connect.initial: customString[0],
  Connect.mobile: customString[1],
  Connect.wifi: customString[1],
  Connect.nodata: customString[2],
};
