import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => MainAppLoadedState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    // TODO: Add your event logic
  }
}
