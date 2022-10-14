import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ui/services/movie_service.dart';
import '../../models/genre.dart';
import 'genre_bloc.dart';
import 'genre_event.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreLoading());

  @override
  Stream<GenreState> mapEventToState(GenreEvent event) async* {
    if (event is GenreEventStarted) {
      yield* _mapMovieEventStateToState();
    }
  }

  Stream<GenreState> _mapMovieEventStateToState() async* {
    final service = MovieService();
    yield GenreLoading();
    try {
      List<Genre> genreList = await service.getGenreList();
      yield GenreLoaded(genreList);
    } on Exception catch (e) {
      print(e);
      yield GenreError();
    }
  }
}