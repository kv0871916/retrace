import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:retrace/provider/auth/social_provider.dart';

class AfterAuthHome extends StatelessWidget {
  const AfterAuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialProvider = Provider.of<SocialProvider>(context, listen: false);
    return Material(
        child: Center(
            child: Column(
      children: [
        Text(socialProvider.user!.displayName!),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () async {
              await socialProvider.signOut();
            },
            icon: const FaIcon(FontAwesomeIcons.signOutAlt),
            label: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Text("Logout"),
            )),
      ],
    )));
  }
}
