import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:retrace/const/constant.dart';
import 'package:retrace/controller/auth/auth_helper.dart';
import 'package:retrace/provider/auth/social_provider.dart';
import 'package:retrace/views/Alert/alert.dart';

class AfterAuthHome extends StatelessWidget {
  const AfterAuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialProvider = Provider.of<SocialProvider>(context, listen: false);
    final _name = socialProvider.user!.displayName ??
        socialProvider.profiledata!.user!.providerData[0].displayName ??
        "No name found";
    final _email = socialProvider.profiledata!.user!.providerData[0].email ??
        socialProvider.user!.email ??
        "No email found";
    final _image = socialProvider.profiledata!.user!.photoURL ??
        socialProvider.profiledata!.user!.providerData[0].photoURL ??
        "";
    return Material(
        color: Colors.black,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(_name),
              subtitle: Text(_email),
              leading: ClipOval(
                child: _image != ""
                    ? Image.network(
                        _image,
                        errorBuilder: (context, error, stackTrace) {
                          return Text(getInitials(string: _name, limitTo: 1));
                        },
                      )
                    : Text(getInitials(string: _name, limitTo: 1)),
              ),
              tileColor: Colors.grey,
            ),
            const Spacer(),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () async {
                  final ConfirmAction? action = await alert(
                      context, 'Are you sure you wanna logout?', 'Yup', 'Nope');
                  if (action == ConfirmAction.accept) {
                    await socialProvider.signOut();
                  }
                },
                icon: const FaIcon(FontAwesomeIcons.signOutAlt),
                label: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text("Logout"),
                )),
            const Spacer(),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () async {
                  final ConfirmAction? action = await alert(
                      context, 'Delete This Account?', 'Yup', 'Nope');
                  await socialProvider.deleteaccount(action!);
                },
                icon: const FaIcon(FontAwesomeIcons.trash),
                label: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Text("Delete Account"),
                )),
            const Spacer(),
          ],
        )));
  }
}
