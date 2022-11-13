import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';



class TimerPage extends StatefulWidget {
    const TimerPage({Key? key}) : super(key: key);

  // static Future<void> navigatorPush(BuildContext context) async {
  //   return Navigator.push<void>(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => TimerPage(),
  //     ),
  //   );
  // }

  @override
  _State createState() => _State();
}

    void main(stopwatch) async {
  Timer.periodic(const Duration(seconds: 1), (Timer scan) async {
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
        _State._stopWatchTimer.onStartTimer();
        scan.cancel();
        
      } else {
        print('まだはいってないよ');
      }
      wifiBSSID = '';
    } else {
      print('ネットに繋がってないよ');
    }
  });
}

class _State extends State<TimerPage> {
  final _isHours = true;

static final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStopped: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
    _stopWatchTimer.fetchStopped
        .listen((value) => print('stopped from stream'));
    _stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));
    main(_stopWatchTimer);

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
    
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('タイマー'),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// Display stop watch time
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: _stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data!;
                      final displayTime =
                          StopWatchTimer.getDisplayTime(value, hours: _isHours);
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              displayTime,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8),
                          //   child: Text(
                          //     value.toString(),
                          //     style: const TextStyle(
                          //         fontSize: 16,
                          //         fontFamily: 'Helvetica',
                          //         fontWeight: FontWeight.w400),
                          //   ),
                          // ),
                        ],
                      );
                    },
                  ),

                  /// Display every minute.
                  // StreamBuilder<int>(
                  //   stream: _stopWatchTimer.minuteTime,
                  //   initialData: _stopWatchTimer.minuteTime.value,
                  //   builder: (context, snap) {
                  //     final value = snap.data;
                  //     print('Listen every minute. $value');
                  //     return Column(
                  //       children: <Widget>[
                  //         Padding(
                  //             padding: const EdgeInsets.all(8),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: <Widget>[
                  //                 const Padding(
                  //                   padding: EdgeInsets.symmetric(horizontal: 4),
                  //                   child: Text(
                  //                     'minute',
                  //                     style: TextStyle(
                  //                       fontSize: 17,
                  //                       fontFamily: 'Helvetica',
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       const EdgeInsets.symmetric(horizontal: 4),
                  //                   child: Text(
                  //                     value.toString(),
                  //                     style: const TextStyle(
                  //                         fontSize: 30,
                  //                         fontFamily: 'Helvetica',
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                 ),
                  //               ],
                  //             )),
                  //       ],
                  //     );
                  //   },
                  // ),

                  /// Display every second.
                  // StreamBuilder<int>(
                  //   stream: _stopWatchTimer.secondTime,
                  //   initialData: _stopWatchTimer.secondTime.value,
                  //   builder: (context, snap) {
                  //     final value = snap.data;
                  //     print('Listen every second. $value');
                  //     return Column(
                  //       children: <Widget>[
                  //         Padding(
                  //             padding: const EdgeInsets.all(8),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: <Widget>[
                  //                 const Padding(
                  //                   padding: EdgeInsets.symmetric(horizontal: 4),
                  //                   child: Text(
                  //                     'second',
                  //                     style: TextStyle(
                  //                       fontSize: 17,
                  //                       fontFamily: 'Helvetica',
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                   padding:
                  //                       const EdgeInsets.symmetric(horizontal: 4),
                  //                   child: Text(
                  //                     value.toString(),
                  //                     style: const TextStyle(
                  //                       fontSize: 30,
                  //                       fontFamily: 'Helvetica',
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             )),
                  //       ],
                  //     );
                  //   },
                  // ),

                  /// Lap time.
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 100,
                      child: StreamBuilder<List<StopWatchRecord>>(
                        stream: _stopWatchTimer.records,
                        initialData: _stopWatchTimer.records.value,
                        builder: (context, snap) {
                          final value = snap.data!;
                          if (value.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          Future.delayed(const Duration(milliseconds: 100), () {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut);
                          });
                          print('Listen records. $value');
                          return ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final data = value[index];
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '${index + 1} ${data.displayTime}',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                  )
                                ],
                              );
                            },
                            itemCount: value.length,
                          );
                        },
                      ),
                    ),
                  ),

                  /// Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: _stopWatchTimer.onStartTimer,
                          child: const Text(
                            'Start',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: _stopWatchTimer.onStopTimer,
                          child: const Text(
                            'Stop',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: _stopWatchTimer.onResetTimer,
                          child: const Text(
                            'Reset',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}