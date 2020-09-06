import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie_banner/provider/movie_provider.dart';
import 'package:smart_movie_banner/screens/error_screen.dart';
import 'package:smart_movie_banner/screens/home.dart';
import 'package:smart_movie_banner/screens/movie_infos_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'bloc/main/main_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      BlocProvider<MainBloc>(
          create: (context) => MainBloc(movieProvider: MovieProvider())..add(MainAppStartedEvent()),
          child: MyApp()
      )
  );
}

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
