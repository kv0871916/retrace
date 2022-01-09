import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const/constant.dart';
import '../../provider/connect/internet_provider.dart';
import '../../provider/theme/theme_provider.dart';

PreferredSizeWidget appBar(BuildContext context) {
  InternetStatus internetstatus = context.watch<InternetStatus>();

  var color = internetstatus.getCurrentColors!;
  var status = internetstatus.getCurrentStatusTitle!;
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: themeManger(c: context, d: bg, l: white),
    title: SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return CupertinoSwitch(
                  activeColor: themeManger(c: context, d: white, l: bg),
                  trackColor: themeManger(c: context, d: white, l: bg),
                  thumbColor: themeManger(c: context, d: bg, l: white),
                  value: themeProvider.thememode == ThemeMode.dark,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  });
            },
          ),
          Text(
            appname,
            style: TextStyle(
                fontSize: 25,
                color: themeManger(c: context, d: white, l: bg),
                textBaseline: TextBaseline.ideographic),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
                color: themeManger(c: context, d: bg, l: white),
                boxShadow: [
                  BoxShadow(
                    color: color,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: color,
                    spreadRadius: -4,
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 1.0, color: color, style: BorderStyle.solid)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    status,
                    style: TextStyle(color: color),
                  ),
                ),
                Icon(Icons.circle, color: color),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
