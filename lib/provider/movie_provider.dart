import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_movie_banner/configuration.dart';
import 'package:smart_movie_banner/models/movie_model.dart';

class MovieProvider{

  Future<File> pickAndPrepareImage(String source) async{
    var file;
    ImagePicker imagePicker = new ImagePicker();
    if (source == "Gallery") file = await imagePicker.getImage(source: ImageSource.gallery);
    if (source == "Camera")  file = await imagePicker.getImage(source: ImageSource.camera);
    File croppedFile = await ImageCropper.cropImage(sourcePath: file.path);
    return croppedFile;
  }

  Future<VisionText> recognizeTextFromImage(File imageFile) async{
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    final TextRecognizer textRecognizer =  FirebaseVision.instance.textRecognizer();
    final Future<VisionText> visionText =  textRecognizer.processImage(visionImage);
    return visionText;
  }

  // ignore: missing_return
  Future<dynamic> getMovieId(String keyword) async{
    String searchUrl = BASE_URL+'/search/movie?api_key='+API_KEY+'&&language='+LANGUAGE+'&query='+keyword+'&page=1';
    final results = await http.Client().get(Uri.encodeFull(searchUrl), headers: {'accept': 'application/json'});
    if (results.statusCode != 200)
      throw Exception();
    else{
      return json.decode(results.body)['results'][0]['id'];
    }


  }

  // ignore: missing_return
  Future<MovieModel> getMovieDetails(dynamic movieId) async{
    String movieDetailsUrl = '$BASE_URL/movie/$movieId?api_key=$API_KEY&&language=$LANGUAGE';
    final results = await http.get(Uri.encodeFull(movieDetailsUrl), headers: {'accept': 'application/json'});
    if (results.statusCode != 200)
      throw Exception();
    else{
      return MovieModel.fromJson(json.decode(results.body));
    }

  }

}