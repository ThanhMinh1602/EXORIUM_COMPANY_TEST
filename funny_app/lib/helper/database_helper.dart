import 'package:funny_app/models/joke_content_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'joke_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE jokes(
        id TEXT PRIMARY KEY,
        jokeContent TEXT,
        isFunny TEXT
      )
    ''');
    await db.insert(
      'jokes',
      JokeContentModel(
        id: '1',
        jokeContent:
            'A child asked his father, "How were people born?" So his father said, '
            '"Adam and Eve made babies, then their babies became adults and made babies, '
            'and so on."The child then went to his mother, asked her the same question and '
            'she told him, "We were monkeys then we evolved to become like we are now."The'
            ' child ran back to his father and said, "You lied to me!" His father replied, '
            '"No, your mom was talking about her side of the family."',
      ).toJson(),
    );

    await db.insert(
      'jokes',
      JokeContentModel(
              id: '2',
              jokeContent:
                  'Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very '
                  'good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what '
                  'does the fat cow give you?" Student: "Homework!"')
          .toJson(),
    );
    await db.insert(
      'jokes',
      JokeContentModel(
              id: '3',
              jokeContent:
                  'The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied '
                  'crying, "Because I heard my daddy tell my mommy, I am going to eat that pussy once '
                  'Jimmy leaves for school today!"')
          .toJson(),
    );
    await db.insert(
        'jokes',
        JokeContentModel(
                id: '4',
                jokeContent:
                    'A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies:'
                    ' "Four!". The accountant says: "I think it`s either 3 or 4. Let me run those figures through'
                    ' my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a'
                    ' hushed voice, "How much do you want it to be?"')
            .toJson());
  }

  Future<int> insertJoke(JokeContentModel joke) async {
    Database db = await database;
    return await db.insert('jokes', joke.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<JokeContentModel>> getJokes() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'jokes',
      where: 'isFunny IS NULL',
    );
    return List.generate(maps.length, (i) {
      return JokeContentModel.fromJson(maps[i]);
    });
  }

  Future<int> updateJokeIsFunny(String id, bool isFunny) async {
    Database db = await database;
    Map<String, dynamic> values = {
      'isFunny': isFunny ? 1 : 0,
    };
    return await db.update(
      'jokes',
      values,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    Database db = await database;
    db.close();
  }
}
