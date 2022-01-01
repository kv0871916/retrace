import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrace/const/constant.dart';
import 'package:retrace/provider/auth/social_provider.dart';

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
    return Scaffold(
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
                : const SocialAuthView()));
  }
}
