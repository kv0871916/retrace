import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retrace/const/constant.dart';

class UserSignupCustom extends StatelessWidget {
  const UserSignupCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmpasswordController =
        TextEditingController();

    return CupertinoFormSection.insetGrouped(
      backgroundColor: bg,
      margin: const EdgeInsets.all(12),
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
        CupertinoFormRow(
          prefix: const Text('Confirm'),
          child: CupertinoTextFormFieldRow(
            controller: _confirmpasswordController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            placeholder: 'Re-enter password',
            validator: (confirmpassword) {
              if (confirmpassword == null || confirmpassword.isEmpty) {
                return 'Password cannot be empty';
              } else if (confirmpassword != _passwordController.text) {
                return 'Please enter same password';
              } else if (confirmpassword.length < 6) {
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
            style: ElevatedButton.styleFrom(primary: Colors.white),
            label: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 20,
                  color: bg,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            icon: FaIcon(
              FontAwesomeIcons.userPlus,
              color: bg,
            ),
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
