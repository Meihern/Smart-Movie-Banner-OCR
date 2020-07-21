import 'package:flutter/material.dart';
import 'package:smart_movie_banner/models/movie_model.dart';
import 'package:smart_movie_banner/widgets/movie_information.dart';

class MovieInfoScreen extends StatelessWidget {
  final MovieModel movieModel;

  const MovieInfoScreen({Key key,@required this.movieModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E12),
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            MovieInformation(movieModel: movieModel,),
          ],
        ),
      ),
    );
  }
}
