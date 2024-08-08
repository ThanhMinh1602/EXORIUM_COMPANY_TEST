import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:funny_app/features/funny_screen/data/funny_repository.dart';
import 'package:funny_app/models/joke_content_model.dart';

part 'funny_event.dart';
part 'funny_state.dart';
part 'funny_bloc.freezed.dart';

class FunnyBloc extends Bloc<FunnyEvent, FunnyState> {
  final FunnyRepository repository;
  FunnyBloc({required this.repository}) : super(const FunnyState()) {
    on(onInit);
    on(onTapFunny);
    add(const FunnyEventInit());
  }
}

extension Handlebloc on FunnyBloc {
  void onInit(FunnyEventInit event, Emitter<FunnyState> emit) async {
    final jokeContentModel = await repository.getNextContentJoker();
    emit(state.copyWith(jokeContentModel: jokeContentModel));
  }

  void onTapFunny(OnTapFunnyEvent event, Emitter<FunnyState> emit) async {
    final isFunny = event.isFunny;
    final id = event.id;
    await repository.updateIsFunny(id, isFunny);
    final jokeContentModel = await repository.getNextContentJoker();
    emit(state.copyWith(jokeContentModel: jokeContentModel));
  }
}
