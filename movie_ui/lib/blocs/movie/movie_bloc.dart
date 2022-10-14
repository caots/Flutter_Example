import 'package:movie_ui/blocs/movie/movie_event.dart';
import 'package:movie_ui/blocs/movie/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ui/services/movie_service.dart';

import '../../models/movie.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(): super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async*{
    if(event is MovieEventStarted){
      yield* _mapMovieEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieState> _mapMovieEventStateToState(int movieId, String query) async*{
    final service = MovieService();
    yield MovieLoading();
    try{
      List<Movie> movieList;
      if(movieId == 0){
        movieList = await service.getNowPlayingMovie();
        yield MovieLoaded(movieList);
      }else{
        movieList = await service.getMovieByGenre(movieId);
        yield MovieLoaded(movieList);
      }
    } on Exception catch(e) {
      print("movie bloc: $e");
      yield MovieError();
    }
  }
}