import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/core/error/no_params.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_state.dart';
import 'package:meta/meta.dart';

class FeedsBloc extends Bloc<NoParams, FeedsState> {
  FeedsBloc({@required this.repository});

  FeedsRepository repository;

  @override
  FeedsState get initialState => FeedsInitial();

  @override
  Stream<FeedsState> mapEventToState(NoParams event) async* {
    yield FeedsLoading();
    final output = await repository.getFeeds();
    yield* output.fold((failure) async* {
      yield FeedsError("Something wrong!");
    }, (feedItems) async* {
      yield FeedsLoaded(feedItems);
    });
  }
}
