import 'package:flutter/material.dart';
import 'package:smart_movie_banner/widgets/camera.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E12),
      body: SafeArea(
        child:ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child:CameraWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
