import 'package:flutter/material.dart';

import 'package:retrace/views/helper/InternetStatus/connect_status_view.dart';
import 'package:retrace/views/home/home_body_view.dart';
import 'package:retrace/views/home/home_header.dart';
import '../helper/Alert/alert.dart';
import '../../const/constant.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool alert = await appexitalert(
            context, "Do you really wanna exit application", "Yeah", "Naah");
        return alert;
      },
      child: Scaffold(
        backgroundColor: bg,
        appBar: appBar(context),
        body: const ConnectStatusView(
          child: HomeBodyView(),
        ),
      ),
    );
  }
}
