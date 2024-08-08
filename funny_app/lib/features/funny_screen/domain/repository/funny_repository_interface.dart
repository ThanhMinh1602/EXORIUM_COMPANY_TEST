import 'package:funny_app/models/joke_content_model.dart';

abstract class FunnyRepositoryInterface {
  Future<JokeContentModel?> getNextContentJoker();
  Future<void> updateIsFunny(String id, bool isFunny);
}
