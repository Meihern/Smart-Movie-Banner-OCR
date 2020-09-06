import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:meta/meta.dart';
import 'package:smart_movie_banner/models/movie_model.dart';
import 'package:smart_movie_banner/provider/movie_provider.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final MovieProvider movieProvider;

  MainBloc({@required this.movieProvider}) : assert(movieProvider != null);

  @override
  MainState get initialState => MainAppLoadingState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is MainAppStartedEvent){
      yield MainAppLoadingState();
      yield MainAppDefaultLoadedState();
    }
    if (event is MainAppSendImageEvent){
      yield MainAppLoadingState();
      try {
        File imageFile = await movieProvider.pickAndPrepareImage(event.imageSource);
        VisionText visionText = await movieProvider.recognizeTextFromImage(imageFile);
        String keyword = visionText.text;
        int movieId = await movieProvider.getMovieId(keyword);
        MovieModel movieModel = await movieProvider.getMovieDetails(movieId);
        yield MainAppMovieDetailState(movie: movieModel);
      }catch (error){
        yield MainAppErrorState(error: error.toString());
      }
    }

  }

}
