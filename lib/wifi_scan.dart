import 'dart:async';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  Timer.periodic(const Duration(seconds: 5), (Timer scan) async {
    final info = NetworkInfo();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('LTEだよ'); // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      var wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
      //print('SSIDはこれ');
      //print(wifiBSSID);
      //var wifiIP = info.getWifiIP(); // 192.168.1.1

      //var wifiName = info.getWifiName(); // FooNetwork

      var homewifi = '02:00:00:00:00:00';
      print('ホームWi－Fiはこっち ${homewifi}');
      print('SSIDはこっち ${wifiBSSID}');
      if (homewifi == wifiBSSID) {
        print('家に入ったよ');
      } else {
        print('まだはいってないよ');
      }
      wifiBSSID = '';
    } else {
      print('ネットに繋がってないよ');
    }
  });
}
