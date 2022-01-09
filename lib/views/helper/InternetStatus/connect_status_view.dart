import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
// ignore_for_file: implementation_imports
import '../Loading/loading.dart';
import '../../../controller/auth/auth_helper.dart';
import '../../../provider/connect/internet_provider.dart';

class ConnectStatusView extends StatefulWidget {
  final Widget child;
  const ConnectStatusView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ConnectStatusView> createState() => _ConnectStatusViewState();
}

class _ConnectStatusViewState extends State<ConnectStatusView> {
  @override
  void initState() {
    context.read<InternetStatus>().connect();

    super.initState();
  }

  Widget _getstatus() {
    Connect result = context.watch<InternetStatus>().getCurrentStatus;
    switch (result) {
      case Connect.initial:
        return laoding();
      case Connect.mobile:
        return widget.child;
      case Connect.wifi:
        return widget.child;
      case Connect.nodata:
        return offline();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getstatus();
  }
}
