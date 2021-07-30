import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(color: Theme.of(context).primaryColor),
        Center(
            child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        )),
      ]),
    );
  }
}
