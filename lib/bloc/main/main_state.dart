part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {}

class MainAppLoadingState extends MainState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class MainAppDefaultLoadedState extends MainState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MainAppMovieDetailState extends MainState{

  final MovieModel movie;

  MainAppMovieDetailState({@required this.movie}) : assert(movie !=null);

  @override
  // TODO: implement props
  List<Object> get props => [movie];

}

class MainAppErrorState extends MainState{

  final String error;

  MainAppErrorState({@required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [error];

}
