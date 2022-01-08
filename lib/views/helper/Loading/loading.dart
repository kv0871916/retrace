import 'package:flutter/material.dart';

Widget laoding() {
  return const Center(
    child: CircularProgressIndicator.adaptive(
      backgroundColor: Colors.white,
    ),
  );
}

Widget offline() {
  return const Center(
    child: Text(
      "Your Offline",
      style: TextStyle(fontSize: 20),
    ),
  );
}
