import 'package:funny_app/helper/database_helper.dart';
import 'package:funny_app/models/joke_content_model.dart';

class JokeFunnyService {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  Future<JokeContentModel?> getNextFunnyJoke() async {
    try {
      final List<JokeContentModel> jokes = await databaseHelper.getJokes();
      if (jokes.isNotEmpty) {
        return jokes.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> insertIsFunny(String id, bool isFunny) async {
    try {
      await databaseHelper.updateJokeIsFunny(id, isFunny);
      return true;
    } catch (e) {
      return false;
    }
  }
}
