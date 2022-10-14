import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ui/blocs/movieDetail/movie_detail_event.dart';
import 'package:movie_ui/blocs/movieDetail/movie_detail_state.dart';
import 'package:movie_ui/services/movie_service.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState>{
  MovieDetailBloc() : super(MovieDetailLoading());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async*{
    if (event is MovieDetailEventStated) {
      yield* _mapMovieDetailStartedToState(event.id);
    }
  }

  Stream<MovieDetailState> _mapMovieDetailStartedToState(int id) async*{
      final movieService = MovieService();
      yield MovieDetailLoading();
      try{
        final movieDetail = await movieService.getMovieDetail(id);
        yield MovieDetailLoaded(movieDetail);
      } on Exception catch(e){
        print(e);
        yield MovieDetailError();
      }
  }
}