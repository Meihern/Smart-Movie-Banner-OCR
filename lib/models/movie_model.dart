class MovieModel{
  String tile;
  String overview;
  String posterImagePath;
  DateTime releaseDate;
  int runtime;
  double popularity;
  List<String> genres;

  MovieModel({this.tile, this.overview, this.posterImagePath, this.releaseDate, this.runtime, this.popularity});

  MovieModel.fromJson(Map<String, dynamic> json){
   List<dynamic> jsonGenres = json['genres'];
   tile = json['title'];
   overview = json['overview'];
   posterImagePath = json['poster_path'];
   releaseDate = json['release_date'];
   runtime = json['runtime'];
   popularity = json['popularity'];
   jsonGenres.forEach((genre){
     genres.add(genre['name']);
   });

  }
}