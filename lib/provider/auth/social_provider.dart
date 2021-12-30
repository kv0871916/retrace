import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:retrace/controller/auth/auth_helper.dart';

class SocialProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final gsignin = GoogleSignIn(
      // scopes: <String>[
      //   'email',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googlesignin() async {
    //init user
    try {
      final guser = await gsignin.signIn();
      if (guser == null) return;
      _user = guser;
      //google authentication
      final gauth = await guser.authentication;
      //google credential
      final gcreds = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken,
        idToken: gauth.idToken,
      );
      final googlesignin =
          await FirebaseAuth.instance.signInWithCredential(gcreds);
      log("Google ${googlesignin.user?.displayName}");

      Fluttertoast.showToast(
          msg: "${user.displayName}",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      notifyListeners();
    } catch (e) {
      log("Error:" + e.toString());
    }
  }

  Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          log("facebookCredential $facebookCredential && userCredential $userCredential");
          Fluttertoast.showToast(
              msg: "${userCredential.user?.displayName}",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          notifyListeners();
          return Resource(status: Status.success);
        case LoginStatus.cancelled:
          notifyListeners();
          return Resource(status: Status.cancelled);
        case LoginStatus.failed:
          notifyListeners();
          return Resource(status: Status.error);
        default:
          return null;
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
