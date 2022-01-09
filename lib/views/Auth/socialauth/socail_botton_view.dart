import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../controller/auth/auth_helper.dart';
import 'social_auth_class.dart';

class SocialLoginBotton extends StatelessWidget {
  const SocialLoginBotton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
