part of 'funny_bloc.dart';

@freezed
class FunnyEvent with _$FunnyEvent {
  const factory FunnyEvent.init() = FunnyEventInit;
  const factory FunnyEvent.funnyEvent(String id, bool isFunny) =
      OnTapFunnyEvent;
}
