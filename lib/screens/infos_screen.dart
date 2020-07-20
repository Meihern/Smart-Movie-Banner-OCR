import 'package:flutter/material.dart';
import 'package:smart_movie_banner/widgets/information.dart';

class InfosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E12),
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            Information(),





          ],
        ),
      ),

    );
  }
}
