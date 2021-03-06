import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth/auth_helper.dart';
import '../../../provider/auth/social_provider.dart';

class SocialAuthBotton extends StatelessWidget {
  final IconData faIcon;
  final Color faColor;
  final LoginType loginType;
  final String textLabel;

  const SocialAuthBotton({
    Key? key,
    required this.faIcon,
    required this.faColor,
    required this.loginType,
    required this.textLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ontap() async {
      final socialProvider =
          Provider.of<SocialProvider>(context, listen: false);

      if (loginType == LoginType.google) {
        await socialProvider.googlesignin();
      }

      if (loginType == LoginType.facebook) {
        await socialProvider.signInWithFacebook();
      }

      if (loginType == LoginType.twitter) {
        await socialProvider.signInWithTwitter();
      }
      if (loginType == LoginType.github) {
        await socialProvider.signInWithGithub(context);
      }
    }

    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: faColor,
            //   spreadRadius: 4,
            //   blurRadius: 10,
            // ),
            // BoxShadow(
            //   color: faColor,
            //   spreadRadius: -4,
            //   blurRadius: 5,
            // ),
            BoxShadow(
              offset: const Offset(2, 2),
              color: faColor.withOpacity(0.40),
              blurRadius: 7.0,
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: faColor,
          shape: BoxShape.rectangle,
        ),
        child: IconButton(
          onPressed: ontap,
          icon: FaIcon(
            faIcon,
            color: Colors.white,
          ),
        ));

    // ElevatedButton.icon(
    //     style: ElevatedButton.styleFrom(primary: faColor),
    //     onPressed: ontap,
    //     icon: faIcon,
    //     label: Container(
    //       padding: const EdgeInsets.all(8),
    //       decoration: const BoxDecoration(
    //         shape: BoxShape.circle,
    //       ),
    //       // child: Text(textLabel),
    //     ));
  }
}
