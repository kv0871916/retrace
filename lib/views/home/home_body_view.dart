import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:retrace/provider/auth/social_provider.dart';
import 'package:retrace/views/Auth/socialauth/social_view.dart';
import 'package:retrace/views/authhome/afterauthview.dart';
import 'package:retrace/views/helper/Loading/loading.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<SocialProvider>().user;
    bool? loading = context.watch<SocialProvider>().loading;

    return Center(
        child: user != null
            ? loading == true
                ? laoding()
                : const AfterAuthHome()
            : const SocialAuthView());
  }
}
