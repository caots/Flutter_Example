import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ui/blocs/person/person_event.dart';
import 'package:movie_ui/blocs/person/person_state.dart';
import 'package:movie_ui/services/movie_service.dart';

import '../../models/person.dart';


class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonLoading());

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event is PersonEventStated) {
      yield* _mapMovieEventStartedToState();
    }
  }

  Stream<PersonState> _mapMovieEventStartedToState() async* {
    final apiRepository = MovieService();
    yield PersonLoading();
    try {
      print('Genrebloc called.');
      final List<Person> persons = await apiRepository.getTrendingPerson();
      yield PersonLoaded(persons);
    } catch (_) {
      yield PersonError();
    }
  }
}
