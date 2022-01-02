import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrace/const/constant.dart';
import 'package:retrace/controller/auth/auth_helper.dart';
import 'package:retrace/provider/auth/social_provider.dart';
import 'package:retrace/views/Alert/alert.dart';

import 'package:retrace/views/authhome/afterauthview.dart';

import '../socialauth/social_view.dart';

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
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade900,
            title: Text(title),
          ),
          body: Center(
              child: user != null
                  ? loading == true
                      ? Column(
                          children: const [
                            LinearProgressIndicator(),
                            Text("Loading..."),
                            LinearProgressIndicator(),
                          ],
                        )
                      : const AfterAuthHome()
                  : const SocialAuthView())),
    );
  }
}
