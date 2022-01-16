import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:retrace/controller/auth/auth_helper.dart';
import 'package:retrace/provider/auth/social_provider.dart';
import 'package:retrace/views/helper/Decoration/decoration.dart';
import '../socialauth/socail_botton_view.dart';
import '../../../provider/theme/theme_provider.dart';
import '../../../const/constant.dart';

class UserLoginCustom extends StatelessWidget {
  const UserLoginCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: CupertinoFormSection.insetGrouped(
        decoration: BoxDecoration(
          color: themeManger(c: context, d: bg, l: white),
        ),
        backgroundColor: themeManger(c: context, d: bg, l: white),
        margin: const EdgeInsets.all(12),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: themeManger(c: context, d: bg, l: white),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                CupertinoFormRow(
                  prefix: Text(
                    'Username',
                    style: TextStyle(
                        color: themeManger(c: context, d: white, l: bg)),
                  ),
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
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: themeManger(c: context, d: bg, l: white),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      boxshadow(
                          context: context,
                          color: themeManger(
                              c: context,
                              d: Colors.white.withOpacity(0.40),
                              l: Colors.lightBlueAccent.withOpacity(0.40))),
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
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: themeManger(c: context, d: white, l: bg),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.signInAlt,
                      color: themeManger(c: context, d: white, l: bg),
                    ),
                    onPressed: () async {
                      final socialProvider =
                          Provider.of<SocialProvider>(context, listen: false);
                      await socialProvider.loginWithEmail(
                          _emailController.text, _passwordController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: themeManger(c: context, d: bg, l: white),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: const SocialLoginBotton()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LottieBuilder.asset(
              "assets/svg/women.json",
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
