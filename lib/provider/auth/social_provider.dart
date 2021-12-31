import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:retrace/controller/resources/resoures.dart';
import 'package:twitter_login/twitter_login.dart';
import '../../controller/auth/auth_helper.dart';

class SocialProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final gsignin = GoogleSignIn(
      // scopes: <String>[
      //   'email',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  GoogleSignInAccount? _guser;
  User? _user;

  GoogleSignInAccount get user => _guser!;
  User get fbuser => _user!;

  Future googlesignin() async {
    //init user
    try {
      final guser = await gsignin.signIn();
      if (guser == null) return;
      _guser = guser;

      //google authentication
      final gauth = await guser.authentication;
      //google credential
      final gcreds = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken,
        idToken: gauth.idToken,
      );
      final googlesignin =
          await FirebaseAuth.instance.signInWithCredential(gcreds);
      _user = googlesignin.user;
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
      if (kIsWeb) {
        FacebookAuthProvider facebookProvider = FacebookAuthProvider();

        facebookProvider.addScope('email');
        facebookProvider.setCustomParameters({
          'display': 'popup',
        });

        await FirebaseAuth.instance
            .signInWithPopup(facebookProvider)
            .then((value) {
          _user = value.user;
          Fluttertoast.showToast(
              msg: "${value.user?.displayName}",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          notifyListeners();
          return Resource(status: Status.success);
        });

        notifyListeners();
        return Resource(status: Status.error);
      } else {
        final LoginResult result = await FacebookAuth.instance.login();
        switch (result.status) {
          case LoginStatus.success:
            final AuthCredential facebookCredential =
                FacebookAuthProvider.credential(result.accessToken!.token);
            final userCredential =
                await _auth.signInWithCredential(facebookCredential);
            _user = userCredential.user;
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
            notifyListeners();
            return null;
        }
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<Resource?> signInWithTwitter() async {
    try {
      if (kIsWeb) {
        // Create a new provider
        TwitterAuthProvider twitterProvider = TwitterAuthProvider();

        // Once signed in, return the UserCredential

        await FirebaseAuth.instance
            .signInWithPopup(twitterProvider)
            .then((value) {
          _user = value.user;
          Fluttertoast.showToast(
              msg: "${value.user?.displayName}",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        });
        // Or use signInWithRedirect
        // return await FirebaseAuth.instance.signInWithRedirect(twitterProvider);

        return Resource(status: Status.success);
      } else {
        // Create a TwitterLogin instance
        final twitterLogin = TwitterLogin(
            apiKey: 'agyxU2ugbC7e5eNd69Oxw5QMx',
            apiSecretKey: 'PIFmO1C8zXwDYiscmexttEgt2CkOmFXmqWtNE8iPobD8odJzIi',
            redirectURI:
                'https://retracestack.firebaseapp.com/__/auth/handler');

        // Trigger the sign-in flow
        final result = await twitterLogin.login();
        switch (result.status) {
          case TwitterLoginStatus.loggedIn:
            // Create a credential from the access token
            final twitterAuthCredential = TwitterAuthProvider.credential(
              accessToken: result.authToken!,
              secret: result.authTokenSecret!,
            );

            // Once signed in, return the UserCredential
            final userCredential = await FirebaseAuth.instance
                .signInWithCredential(twitterAuthCredential);
            _user = userCredential.user;
            log("facebookCredential $userCredential && userCredential $userCredential");
            Fluttertoast.showToast(
                msg: "${userCredential.user?.displayName}",
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            notifyListeners();

            return Resource(status: Status.success);
          case TwitterLoginStatus.cancelledByUser:
            notifyListeners();
            return Resource(status: Status.cancelled);
          case TwitterLoginStatus.error:
            notifyListeners();
            return Resource(status: Status.error);
          default:
            notifyListeners();
            return null;
        }
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
