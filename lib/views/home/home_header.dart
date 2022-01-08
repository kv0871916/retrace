import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:retrace/const/constant.dart';

import 'package:retrace/provider/connect/internet_provider.dart';

PreferredSizeWidget appBar(BuildContext context) {
  var color = context.watch<InternetStatus>().getCurrentColors!;
  var status = context.watch<InternetStatus>().getCurrentStatusTitle!;
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: bg,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appname,
          style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              textBaseline: TextBaseline.ideographic),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
              color: bg,
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
  );
}
