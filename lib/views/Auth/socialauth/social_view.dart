import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retrace/controller/auth/auth_helper.dart';
import 'package:retrace/views/Auth/userauth/login.dart';
import 'package:retrace/views/Auth/userauth/signup.dart';
import 'social_auth_class.dart';

class SocialAuthView extends StatelessWidget {
  const SocialAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.aspectRatio;
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.blueAccent,
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                  indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  tabs: const <Widget>[
                    Tab(
                      text: 'Login',
                    ),
                    Tab(
                      text: 'Register',
                    ),
                  ]),
            ),
          ),
          const Expanded(
            flex: 2,
            child: TabBarView(children: <Widget>[
              UserLoginCustom(),
              UserSignupCustom(),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SocialAuthBotton(
                  faIcon: FontAwesomeIcons.google,
                  faColor: Colors.red,
                  loginType: LoginType.google,
                  textLabel: "Google",
                ),
                SocialAuthBotton(
                  faIcon: FontAwesomeIcons.facebook,
                  faColor: Colors.blue,
                  loginType: LoginType.facebook,
                  textLabel: "Facebook",
                ),
                SocialAuthBotton(
                  faIcon: FontAwesomeIcons.twitter,
                  faColor: Colors.lightBlue,
                  loginType: LoginType.twitter,
                  textLabel: "Twitter",
                ),
                SocialAuthBotton(
                  faIcon: FontAwesomeIcons.github,
                  faColor: Colors.blueGrey,
                  loginType: LoginType.github,
                  textLabel: "Github",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
