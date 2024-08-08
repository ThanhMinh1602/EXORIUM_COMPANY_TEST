import 'package:funny_app/features/funny_screen/domain/repository/funny_repository_interface.dart';
import 'package:funny_app/models/joke_content_model.dart';
import 'package:funny_app/services/joke_funny_service.dart';

class FunnyRepository implements FunnyRepositoryInterface {
  final JokeFunnyService jokeFunnyService = JokeFunnyService();
  @override
  Future<JokeContentModel?> getNextContentJoker() async {
    final data = await jokeFunnyService.getNextFunnyJoke();
    return data;
  }

  @override
  Future<void> updateIsFunny(String id, bool isFunny) async {
    await jokeFunnyService.insertIsFunny(id, isFunny);
  }
}
