import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie_banner/provider/movie_provider.dart';
import 'package:smart_movie_banner/screens/error_screen.dart';
import 'package:smart_movie_banner/screens/home.dart';
import 'package:smart_movie_banner/screens/movie_infos_screen.dart';

import 'bloc/main/main_bloc.dart';

void main() => runApp(
    BlocProvider<MainBloc>(
        create: (context) => MainBloc(movieProvider: MovieProvider())..add(MainAppStartedEvent()),
        child: MyApp()
    )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Movie Banner",
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<MainBloc, MainState>(
        // ignore: missing_return
        builder: (BuildContext context, MainState state) {
          if (state is MainAppLoadingState) {
            return Scaffold(
              body: Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          if (state is MainAppDefaultLoadedState){
            return Home();
          }
          if (state is MainAppMovieDetailState){
            return MovieInfoScreen(movieModel: state.movie,);
          }
          if (state is MainAppErrorState){
            return ErrorScreen(error: state.error,);
          }
        },
      ),
    );
  }
}
