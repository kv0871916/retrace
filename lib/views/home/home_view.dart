import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrace/const/constant.dart';
import 'package:retrace/views/Auth/socialauth/social_view.dart';
import '../../provider/auth/social_provider.dart';
import '../Alert/alert.dart';
import '../authhome/afterauthview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<SocialProvider>().user;
    bool? loading = context.watch<SocialProvider>().loading;
    return WillPopScope(
      onWillPop: () async {
        // await showDialog or Show add banners or whatever
        final bool alert = await appexitalert(
            context, "Do you really wanna exit application", "Yeah", "Naah");

        // then
        return alert; // return true if the route to be popped
      },
      child: Scaffold(
          backgroundColor: bg,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: bg,
            title: Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  textBaseline: TextBaseline.ideographic),
            ),
          ),
          body: Center(
              child: user != null
                  ? loading == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            LinearProgressIndicator(),
                            LinearProgressIndicator(),
                          ],
                        )
                      : const AfterAuthHome()
                  : const SocialAuthView())),
    );
  }
}
