import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import '../../const/Internet/colors_internet.dart';
import '../../controller/auth/auth_helper.dart';

class InternetStatus extends ChangeNotifier {
  Connect getCurrentStatus = Connect.initial;
  Color? getCurrentColors = connectmap[Connect.initial];
  String? getCurrentStatusTitle = connectext[Connect.initial];
  connect() async {
    log(getCurrentColors.toString());
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        getCurrentStatus = Connect.mobile;
        getCurrentColors = connectmap[Connect.mobile];
        getCurrentStatusTitle = connectext[Connect.mobile];
        notifyListeners();
        break;
      case ConnectivityResult.wifi:
        getCurrentStatus = Connect.wifi;
        getCurrentColors = connectmap[Connect.wifi];
        getCurrentStatusTitle = connectext[Connect.wifi];
        notifyListeners();
        break;
      case ConnectivityResult.none:
        getCurrentStatus = Connect.nodata;
        getCurrentColors = connectmap[Connect.nodata];
        getCurrentStatusTitle = connectext[Connect.nodata];
        notifyListeners();
        break;
      default:
        getCurrentStatus = Connect.initial;
        getCurrentColors = connectmap[Connect.initial];
        getCurrentStatusTitle = connectext[Connect.initial];
        notifyListeners();
        break;
    }
    notifyListeners();
  }

  setcolor() async {
    Connect result = await connect();

    getCurrentColors = connectmap[result];
    log(getCurrentColors.toString() + "  space  " + result.toString());
  }
}
