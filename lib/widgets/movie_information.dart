import 'package:flutter/material.dart';
import 'package:smart_movie_banner/models/movie_model.dart';
import 'package:smart_movie_banner/widgets/movie_info_card.dart';

class MovieInformation extends StatelessWidget {

  final MovieModel movieModel;

  const MovieInformation({Key key, @required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10,bottom: 10,),
    child: Column(
    children: <Widget>[
             Container(
              height:700,
                  child:Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          //bottom: 2,
                          right: 10,
                          left: 10,
                          child:  Image.asset("assets/images/Joker.jpg",fit: BoxFit.fill,),

             ),
                      ]
                  ),
                ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(

            padding: const EdgeInsets.all(10.0),
            child: Text("Information :",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 30),
              ),
          ),
          MovieInfoCard(movie: movieModel,),

        ],
      ),

    ],

      
    )  );
  }
}
