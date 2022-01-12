import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:retrace/views/helper/Decoration/decoration.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../const/constant.dart';
import '../../../provider/theme/theme_provider.dart';
import '../userauth/login.dart';
import '../userauth/signup.dart';

class SocialAuthView extends StatelessWidget {
  const SocialAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("height::: ${MediaQuery.of(context).size.height}");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: themeManger(c: context, d: bg, l: white),
          title: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: themeManger(c: context, d: bg, l: white),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   boxshadow(
              //       context: context,
              //       y: 0,
              //       color: themeManger(
              //           c: context,
              //           d: Colors.white.withOpacity(0.10),
              //           l: Colors.lightBlueAccent.withOpacity(0.10))),
              // ],
              border: Border.all(
                  width: 0.5,
                  color: themeManger(c: context, d: bg, l: white),
                  style: BorderStyle.solid),
              //  color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TabBar(
                unselectedLabelColor: themeManger(c: context, d: white, l: bg),
                labelColor: themeManger(c: context, d: white, l: bg),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
                indicator: BoxDecoration(
                    color: themeManger(c: context, d: bg, l: white),
                    border: Border.all(
                        width: 0.5,
                        color: themeManger(c: context, d: white, l: bg),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                tabs: const <Widget>[
                  Tab(
                    text: 'Login',
                  ),
                  Tab(
                    text: 'Register',
                  ),
                ]).glassMorphic(),
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: themeManger(c: context, d: bg, l: white),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                child: TabBarView(children: <Widget>[
                  UserLoginCustom(),
                  UserSignupCustom(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
