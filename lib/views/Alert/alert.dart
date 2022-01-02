import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:retrace/controller/auth/auth_helper.dart';

alert(BuildContext context, String reason, String accept, String reject,
    {IconData? faIcon}) {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(reason),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                label: Text(accept),
                icon: FaIcon(
                  faIcon ?? FontAwesomeIcons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.accept);
                },
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                label: Text(reject),
                icon: FaIcon(
                  faIcon ?? FontAwesomeIcons.times,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.cancel);
                },
              ),
            ],
          )
        ],
      );
    },
  );
}

appexitalert(BuildContext context, String reason, String accept, String reject,
    {IconData? faIcon}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(reason),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                label: Text(accept),
                icon: FaIcon(
                  faIcon ?? FontAwesomeIcons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                label: Text(reject),
                icon: FaIcon(
                  faIcon ?? FontAwesomeIcons.times,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
