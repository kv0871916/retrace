import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../const/constant.dart';

class SlidingCard extends StatelessWidget {
  final String email;
  final String displayname;
  final String image;
  final double offset;
  final void Function() onPressed;

  const SlidingCard(
      {Key? key,
      required this.email,
      required this.displayname,
      required this.image,
      required this.offset,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.network(
                image,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: CardContent(
                email: email,
                displayname: displayname,
                offset: gauss,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String email;
  final String displayname;
  final double offset;
  final void Function() onPressed;
  const CardContent(
      {Key? key,
      required this.email,
      required this.displayname,
      required this.offset,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(email, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              displayname,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: ElevatedButton.icon(
                  icon: const FaIcon(FontAwesomeIcons.signOutAlt),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      primary: bg,
                      textStyle: const TextStyle(
                        color: Colors.white,
                      )),
                  label: Transform.translate(
                    offset: Offset(24 * offset, 0),
                    child: const Text('Logout'),
                  ),
                  onPressed: onPressed,
                ),
              ),
              const Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}
