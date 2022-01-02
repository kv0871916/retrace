import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserLoginCustom extends StatelessWidget {
  const UserLoginCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    double size = MediaQuery.of(context).size.aspectRatio;
    return CupertinoFormSection.insetGrouped(
      backgroundColor: const Color(0xFF162A49),
      margin: const EdgeInsets.all(12),
      header: Row(
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: size * 50,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
      children: [
        CupertinoFormRow(
          prefix: const Text('Username'),
          child: CupertinoTextFormFieldRow(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              placeholder: 'Enter Username',
              validator: (username) {
                if (username == null || username.isEmpty) {
                  return 'Username cannot be empty';
                } else if (username.length < 6) {
                  return 'Must be atleast 6 characters long';
                } else {
                  return null;
                }
              }),
        ),
        CupertinoFormRow(
          prefix: const Text('Password'),
          child: CupertinoTextFormFieldRow(
            controller: _passwordController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            placeholder: 'Enter password',
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Password cannot be empty';
              } else if (password.length < 6) {
                return 'Must be atleast 6 characters long';
              } else {
                return null;
              }
            },
          ),
        ),
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
            label: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: const Text(
                "Register",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.userPlus),
            onPressed: () async {
              await Fluttertoast.showToast(
                  msg: "Work in progress",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            label: AnimatedContainer(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              duration: const Duration(milliseconds: 500),
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.signInAlt),
            onPressed: () async {
              await Fluttertoast.showToast(
                  msg: "Work in progress",
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
        ],
      ),
    );
  }
}
