import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth/social_provider.dart';

var allprovider = [
  ChangeNotifierProvider<SocialProvider>(
    create: (context) => SocialProvider(),
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
