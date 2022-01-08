import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth/social_provider.dart';
import '../provider/connect/internet_provider.dart';

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

String appname = "Retrace Stack";
