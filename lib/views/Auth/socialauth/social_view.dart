import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../../../const/constant.dart';
import '../../../controller/auth/auth_helper.dart';
import '../userauth/login.dart';
import 'package:retrace/views/Auth/userauth/signup.dart';
import 'social_auth_class.dart';

class SocialAuthView extends StatelessWidget {
  const SocialAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_xk9jkg7k.json'),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    width: 1.0, color: Colors.white, style: BorderStyle.solid),
                //  color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TabBar(
                  padding: const EdgeInsets.all(5),
                  unselectedLabelColor: Colors.white,
                  labelColor: bg,
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlueAccent.shade700,
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.lightBlueAccent.shade400,
                          spreadRadius: -4,
                          blurRadius: 5,
                        )
                      ],
                      color: Colors.white,
                      border: Border.all(
                          width: 1.0,
                          color: Colors.white,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25)),
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
          const Flexible(
            flex: 5,
            child: TabBarView(children: <Widget>[
              UserLoginCustom(),
              UserSignupCustom(),
            ]),
          ),
          Flexible(
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
