import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late UnityViewController unityViewController;
  double speed = 0.0;

  void onUnityViewCreated(UnityViewController controller) {
    setState(() {
      unityViewController = controller;
    });
  }

  void onUnityViewReattached(UnityViewController controller) {
    setState(() {
      unityViewController = controller;
    });
  }

  void onUnityMessageReceived(UnityViewController controller, String message) {
    debugPrint('[message]: $message');
  }

  void setSpeed(double val) {
    setState(() {
      speed = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: UnityView(
              onCreated: onUnityViewCreated,
              onReattached: onUnityViewReattached,
              onMessage: onUnityMessageReceived,
            ),
          ),
          Flexible(
            child: Slider.adaptive(
              value: speed,
              onChanged: setSpeed,
              min: 0,
              max: 400,
            ),
          ),
        ],
      ),
    );
  }
}
