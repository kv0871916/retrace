import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:retrace/views/helper/Decoration/decoration.dart';

import '../socialauth/socail_botton_view.dart';

import '../../../provider/theme/theme_provider.dart';

import '../../../const/constant.dart';

class UserSignupCustom extends StatelessWidget {
  const UserSignupCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("internalheight::: ${MediaQuery.of(context).size.height}");
    //final _formKey = GlobalKey<FormState>();
    final TextEditingController _firstnameController = TextEditingController();
    final TextEditingController _lastnameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmpasswordController =
        TextEditingController();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: CupertinoFormSection.insetGrouped(
        decoration: BoxDecoration(
          color: themeManger(c: context, d: bg, l: white),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: themeManger(c: context, d: bg, l: white),
        margin: const EdgeInsets.all(12),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: themeManger(c: context, d: bg, l: white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  child: const Center(
                      child: Text(
                    'Personal Details',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                CupertinoFormRow(
                  prefix: Text(
                    'Firstname',
                    style: TextStyle(
                        color: themeManger(c: context, d: white, l: bg)),
                  ),
                  child: CupertinoTextFormFieldRow(
                      controller: _firstnameController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      placeholder: 'Enter Firstname',
                      validator: (username) {
                        if (username == null || username.isEmpty) {
                          return 'Firstname cannot be empty';
                        } else if (username.length < 6) {
                          return 'Must be atleast 6 characters long';
                        } else {
                          return null;
                        }
                      }),
                ),
                CupertinoFormRow(
                  prefix: Text(
                    'Lastname',
                    style: TextStyle(
                        color: themeManger(c: context, d: white, l: bg)),
                  ),
                  child: CupertinoTextFormFieldRow(
                      controller: _lastnameController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      placeholder: 'Enter Lastname',
                      validator: (username) {
                        if (username == null || username.isEmpty) {
                          return 'Lastname cannot be empty';
                        } else if (username.length < 6) {
                          return 'Must be atleast 6 characters long';
                        } else {
                          return null;
                        }
                      }),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: themeManger(c: context, d: bg, l: white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  child: const Center(
                      child: Text(
                    'Account Details',
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                CupertinoFormRow(
                  prefix: Text(
                    'Email',
                    style: TextStyle(
                        color: themeManger(c: context, d: white, l: bg)),
                  ),
                  child: CupertinoTextFormFieldRow(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      placeholder: 'Enter Email',
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
                  prefix: Text(
                    'Password',
                    style: TextStyle(
                        color: themeManger(c: context, d: white, l: bg)),
                  ),
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
                  prefix: Text(
                    'Confirm',
                    style: TextStyle(
                        color: themeManger(c: context, d: white, l: bg)),
                  ),
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
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: themeManger(c: context, d: bg, l: white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: themeManger(c: context, d: bg, l: white),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      boxshadow(
                        context: context,
                        color: themeManger(c: context, d: white, l: bg),
                      ),
                    ],
                    border: Border.all(
                        width: 0.5,
                        color: themeManger(c: context, d: white, l: bg),
                        style: BorderStyle.solid),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: themeManger(c: context, d: bg, l: white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    label: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          color: themeManger(c: context, d: white, l: bg),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.userPlus,
                      color: themeManger(c: context, d: white, l: bg),
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
          ),
          Container(
              decoration: BoxDecoration(
                color: themeManger(c: context, d: bg, l: white),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(20.0),
              child: const SocialLoginBotton()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LottieBuilder.asset(
              "assets/svg/halloween.json",
              frameBuilder: (context, child, composition) {
                return AnimatedOpacity(
                  opacity: composition == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
