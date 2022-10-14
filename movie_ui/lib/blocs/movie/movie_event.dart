import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class MovieEventStarted extends MovieEvent {
  final int movieId;
  final String query;

  const MovieEventStarted(this.movieId, this.query);
}
