import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../const/constant.dart';
import '../../controller/auth/auth_helper.dart';
import '../../provider/auth/social_provider.dart';
import '../helper/Alert/alert.dart';
import '../helper/Slider/slider.dart';

class AfterAuthHome extends StatefulWidget {
  const AfterAuthHome({Key? key}) : super(key: key);

  @override
  State<AfterAuthHome> createState() => _AfterAuthHomeState();
}

class _AfterAuthHomeState extends State<AfterAuthHome> {
  late PageController pageController;
  double pageOffset = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
        color: bg,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
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
                  ? ClipOval(
                      child: Image.network(
                        _image,
                        errorBuilder: (context, error, stackTrace) {
                          return Text(getInitials(string: _name, limitTo: 2));
                        },
                      ),
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
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: PageView(
                controller: pageController,
                children: <Widget>[
                  SlidingCard(
                    email: _email,
                    displayname: _name,
                    offset: pageOffset,
                    image: _image,
                    onPressed: () async {
                      final ConfirmAction? action = await alert(context,
                          'Are you sure you wanna logout?', 'Yup', 'Nope');
                      if (action == ConfirmAction.accept) {
                        await socialProvider.signOut();
                      }
                    },
                  ),
                  SlidingCard(
                    email: _email,
                    displayname: _name,
                    offset: pageOffset - 1,
                    image: _image,
                    onPressed: () async {
                      final ConfirmAction? action = await alert(context,
                          'Are you sure you wanna logout?', 'Yup', 'Nope');
                      if (action == ConfirmAction.accept) {
                        await socialProvider.signOut();
                      }
                    },
                  ),
                ],
              ),
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
