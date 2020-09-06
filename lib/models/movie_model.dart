import 'dart:convert';

class MovieModel{
  String tile;
  String overview;
  String posterImagePath;
  DateTime releaseDate;
  int runtime;
  double popularity;
  List<String> genres = new List<String>();

  MovieModel({this.tile, this.overview, this.posterImagePath, this.releaseDate, this.runtime, this.popularity});

  MovieModel.fromJson(dynamic json){

   List<dynamic> jsonGenres = json['genres'].map((genreJson) => Genre.fromJson(genreJson)).toList();
   tile = json['title'];
   overview = json['overview'];
   posterImagePath = json['poster_path'];
   releaseDate = DateTime.parse(json['release_date']);
   runtime = json['runtime'];
   popularity = json['popularity'];
   jsonGenres.forEach((dynamicGenre){
     print(dynamicGenre);
     genres.add(dynamicGenre.name);
   });
   
  }
  @override
  String toString() {
    return 'MovieModel{tile: $tile, overview: $overview, posterImagePath: $posterImagePath, releaseDate: $releaseDate, runtime: $runtime, popularity: $popularity, genres: $genres}';
  }
}

class Genre{
  int id;
  String name;

  Genre(this.id, this.name);
  
  factory Genre.fromJson(dynamic json){
    return Genre(json['id'] as int, json['name'] as String);
  }

  @override
  String toString() {
    return 'Genre{id: $id, name: $name}';
  }
}