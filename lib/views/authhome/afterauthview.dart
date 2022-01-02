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
    final size = MediaQuery.of(context).size;
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
            Stack(
              children: [
                LinearProgressIndicator(
                  minHeight: size.aspectRatio * 180,
                  backgroundColor: Colors.deepPurpleAccent,
                  color: Colors.deepPurpleAccent.shade700,
                ),
                Container(
                  height: size.aspectRatio * 180,
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text(
                      _name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      _email,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      color: Colors.white,
                      onPressed: () async {
                        final ConfirmAction? action = await alert(
                            context, 'Delete This Account?', 'Yup', 'Nope');
                        await socialProvider.deleteaccount(action!);
                      },
                      icon: const FaIcon(FontAwesomeIcons.trash),
                    ),
                    leading: _image != ""
                        ? Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: size.aspectRatio * 100,
                                width: size.aspectRatio * 100,
                                margin: EdgeInsets.all(size.aspectRatio * 5),
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  color: Colors.deepPurpleAccent.shade700,
                                ),
                              ),
                              Container(
                                height: size.aspectRatio * 100,
                                width: size.aspectRatio * 100,
                                padding: EdgeInsets.all(size.aspectRatio * 5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    _image,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Text(getInitials(
                                          string: _name, limitTo: 2));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            height: size.aspectRatio * 100,
                            width: size.aspectRatio * 100,
                            // color: Colors.black,
                            alignment: Alignment.center,
                            child: Text(
                              getInitials(string: _name, limitTo: 2),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.aspectRatio * 50,
                              ),
                            ),
                          ),
                    tileColor: Colors.grey,
                  ),
                ),
              ],
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
