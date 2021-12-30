import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controller/auth/auth_helper.dart';

import 'social_auth_class.dart';

class SocialAuthView extends StatelessWidget {
  const SocialAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'RETRACE STACK',
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey.shade800,
          ),
        ),
        const SocialAuthBotton(
          faIcon: FaIcon(FontAwesomeIcons.google),
          faColor: Colors.red,
          loginType: LoginType.google,
          textLabel: "Google",
        ),
        const SocialAuthBotton(
          faIcon: FaIcon(FontAwesomeIcons.facebook),
          faColor: Colors.blue,
          loginType: LoginType.facebook,
          textLabel: "Facebook",
        ),
      ],
    );
  }
}
