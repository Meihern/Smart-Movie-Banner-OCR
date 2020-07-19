part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {}

class MainAppStartedEvent extends MainEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class MainAppSendImageEvent extends MainEvent{

  final String imageSource;

  MainAppSendImageEvent({@required this.imageSource});

  @override
  // TODO: implement props
  List<Object> get props => [imageSource];

}
