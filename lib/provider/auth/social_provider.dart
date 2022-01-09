import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../controller/auth/auth_helper.dart';
import '../../controller/resources/resoures.dart';

class SocialProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final gsignin = GoogleSignIn();
  // Create a TwitterLogin instance
  final twitterLogin = TwitterLogin(
      apiKey: '7ZDT0k5z1nIX6rZgaZ8i8mqds',
      apiSecretKey: 'MbqGfCewXfh7ljJ1nUtbkNI1XSSxfMVFYGI8tiR2tMxwBepwne',
      redirectURI: 'retracestack://');
  // Create a GitHubSignIn instance
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: "40947fc59a4803711f2f",
      clientSecret: "486352f6476f09eb6ded7df9024393b09b563d80",
      title: 'Retrace Stack',
      centerTitle: true,
      redirectUrl: 'https://retracestack.firebaseapp.com/__/auth/handler');

  GoogleSignInAccount? _guser;
  User? _user;
  bool? _loading;
  bool get loading => _loading ?? false;
  GoogleSignInAccount get guser => _guser!;
  User? get user => _user;
  UserCredential? _profiledata;
  UserCredential? get profiledata => _profiledata;

  Future deleteaccount(ConfirmAction action) async {
    if (action == ConfirmAction.accept) {
      try {
        _loading = true;
        await Fluttertoast.showToast(
            msg: "Successfully deleted your account ${_user!.displayName}",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        await auth.currentUser!.delete();
        await signOut();
        _loading = false;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          log('The user must reauthenticate before this operation can be executed.');
          notifyListeners();
        }
      }
    }
  }

  Future googlesignin() async {
    //init user
    try {
      _loading = true;
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

      await auth.signInWithCredential(gcreds).then((value) {
        _user = value.user;
        _profiledata = value;
        log("GoogleCredential $gcreds && userCredential $value");
        Fluttertoast.showToast(
            msg: "${value.user!.displayName}",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        _loading = false;
        notifyListeners();
      });

      _loading = false;
      notifyListeners();
    } catch (e) {
      log("Error:" + e.toString());
      notifyListeners();
    }
  }

  Future<Resource?> signInWithFacebook() async {
    try {
      if (kIsWeb) {
        _loading = true;
        FacebookAuthProvider facebookProvider = FacebookAuthProvider();

        facebookProvider.addScope('email');
        facebookProvider.setCustomParameters({
          'display': 'popup',
        });

        await auth.signInWithPopup(facebookProvider).then((value) {
          _user = value.user;
          _profiledata = value;
          Fluttertoast.showToast(
              msg: "${value.user!.displayName}",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          _loading = false;
          notifyListeners();
          return Resource(status: Status.success);
        });
        _loading = false;
        notifyListeners();
        return Resource(status: Status.error);
      } else {
        _loading = true;
        final LoginResult result = await FacebookAuth.instance.login();
        switch (result.status) {
          case LoginStatus.success:
            final AuthCredential facebookCredential =
                FacebookAuthProvider.credential(result.accessToken!.token);
            await auth.signInWithCredential(facebookCredential).then((value) {
              _user = value.user;
              _profiledata = value;
              log("facebookCredential $facebookCredential && userCredential $value");
              Fluttertoast.showToast(
                  msg: "${value.user!.displayName}",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              _loading = false;
              notifyListeners();
            });
            _loading = false;
            notifyListeners();

            return Resource(status: Status.success);
          case LoginStatus.cancelled:
            _loading = false;
            notifyListeners();
            return Resource(status: Status.cancelled);
          case LoginStatus.failed:
            _loading = false;
            notifyListeners();
            return Resource(status: Status.error);
          default:
            _loading = false;
            notifyListeners();
            return null;
        }
      }
    } on FirebaseAuthException {
      _loading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<Resource?> signInWithTwitter() async {
    try {
      if (kIsWeb) {
        _loading = true;
        // Create a new provider
        TwitterAuthProvider twitterProvider = TwitterAuthProvider();

        // Once signed in, return the UserCredential

        await auth.signInWithPopup(twitterProvider).then((value) {
          _user = value.user;
          _profiledata = value;
          log("twitterProvider $twitterProvider && userCredential $value");
          Fluttertoast.showToast(
              msg: "${value.user!.displayName}",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          _loading = false;
          notifyListeners();
        });
        // Or use signInWithRedirect
        // return await FirebaseAuth.instance.signInWithRedirect(twitterProvider);
        _loading = false;
        notifyListeners();
        return Resource(status: Status.success);
      } else {
        // Trigger the sign-in flow
        _loading = true;
        final result = await twitterLogin.login();
        switch (result.status) {
          case TwitterLoginStatus.loggedIn:
            // Create a credential from the access token
            final twitterAuthCredential = TwitterAuthProvider.credential(
              accessToken: result.authToken!,
              secret: result.authTokenSecret!,
            );

            // Once signed in, return the UserCredential
            await auth
                .signInWithCredential(twitterAuthCredential)
                .then((value) {
              _user = value.user;
              _profiledata = value;
              log("facebookCredential $twitterAuthCredential && userCredential $value");
              Fluttertoast.showToast(
                  msg: "${value.user!.displayName}",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              _loading = false;
              notifyListeners();
            });
            _loading = false;
            notifyListeners();

            return Resource(status: Status.success);
          case TwitterLoginStatus.cancelledByUser:
            _loading = false;
            notifyListeners();
            return Resource(status: Status.cancelled);
          case TwitterLoginStatus.error:
            _loading = false;
            notifyListeners();
            return Resource(status: Status.error);
          default:
            _loading = false;
            notifyListeners();
            return null;
        }
      }
    } on FirebaseAuthException {
      _loading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<Resource?> signInWithGithub(BuildContext context) async {
    try {
      if (kIsWeb) {
        _loading = true;
        // Create a new provider
        GithubAuthProvider githubProvider = GithubAuthProvider();
        // Once signed in, return the UserCredential
        await FirebaseAuth.instance
            .signInWithPopup(githubProvider)
            .then((value) {
          _user = value.user;
          _profiledata = value;
          Fluttertoast.showToast(
              msg: "${value.user!.displayName}",
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          _loading = false;
          notifyListeners();
        });
        // Or use signInWithRedirect
        // return await FirebaseAuth.instance.signInWithRedirect(twitterProvider);
        _loading = false;
        notifyListeners();
        return Resource(status: Status.success);
      } else {
        _loading = true;
        // Trigger the sign-in flow
        final result = await gitHubSignIn.signIn(context);

        switch (result.status) {
          case GitHubSignInResultStatus.ok:
            // Create a credential from the access token
            // Create a credential from the access token
            final githubAuthCredential =
                GithubAuthProvider.credential(result.token!);

            // Once signed in, return the UserCredential
            await auth.signInWithCredential(githubAuthCredential).then((value) {
              _user = value.user;
              _profiledata = value;
              log("githubAuthCredential $githubAuthCredential && userCredential $value");
              Fluttertoast.showToast(
                  msg: "${value.user!.displayName}",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              _loading = false;
              notifyListeners();
            });
            _loading = false;
            notifyListeners();
            return Resource(status: Status.success);
          case GitHubSignInResultStatus.cancelled:
            _loading = false;
            notifyListeners();
            return Resource(status: Status.cancelled);
          case GitHubSignInResultStatus.failed:
            _loading = false;
            notifyListeners();
            return Resource(status: Status.error);
          default:
            _loading = false;
            notifyListeners();
            return null;
        }
      }
    } on FirebaseAuthException {
      _loading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signOut() async {
    _loading = true;
    await Future.delayed(const Duration(seconds: 1));
    await gsignin.signOut();
    await auth.signOut();
    _guser = null;
    _user = null;
    _loading = false;
    notifyListeners();
  }
}
