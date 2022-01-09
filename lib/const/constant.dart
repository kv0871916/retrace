import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth/social_provider.dart';
import '../provider/connect/internet_provider.dart';
import '../provider/theme/theme_provider.dart';

var allprovider = [...remoteProvider, ...localprovider];
var remoteProvider = [
  ChangeNotifierProvider<SocialProvider>(
    create: (context) => SocialProvider(),
  ),
];
var localprovider = [
  ChangeNotifierProvider<InternetStatus>(
    create: (context) => InternetStatus(),
  ),
  ChangeNotifierProvider<ThemeProvider>(
    create: (context) => ThemeProvider(),
  ),
];
String getInitials({String? string, int? limitTo}) {
  var buffer = StringBuffer();
  var split = string!.split(' ');
  for (var i = 0; i < (limitTo ?? split.length); i++) {
    buffer.write(split[i][0]);
  }

  return buffer.toString();
}

Color bg = const Color(0xFF162A49);
Color white = Colors.white;
String appname = "Retrace Stack";
