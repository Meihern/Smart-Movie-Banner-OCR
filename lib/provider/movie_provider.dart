import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<dynamic> getMovieDetails(String movieName) async{
  }




}