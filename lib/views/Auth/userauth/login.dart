import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../const/constant.dart';

class UserLoginCustom extends StatelessWidget {
  const UserLoginCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

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
      ],
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent.shade700,
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: Colors.lightBlueAccent.shade400,
                  spreadRadius: -4,
                  blurRadius: 5,
                )
              ],
            ),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              label: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 50,
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    color: bg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              icon: FaIcon(
                FontAwesomeIcons.signInAlt,
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
          ),
        ],
      ),
    );
  }
}
