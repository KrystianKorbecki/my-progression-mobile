import 'package:my_progression_mobile/db/DatabaseCreator.dart';
import 'package:my_progression_mobile/model/BodyPart.dart';
import 'package:my_progression_mobile/model/Exercise.dart';

class ExerciseEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<Exercise> create(Exercise exercise) async {
    final db = await instance.database;
    final id = await db!.insert(tableExercise, exercise.toJson());
    instance.close();
    return exercise.copy(id: id);
  }

  static Future<Exercise> readExercise(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableExercise,
        columns: ExerciseField.values,
        where: '${ExerciseField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Exercise.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableExercise,
        where: '${ExerciseField.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(Exercise exercise) async {
    final db = await instance.database;
    return db!.update(tableExercise, exercise.toJson(),
        where: '${ExerciseField.id} = ?', whereArgs: [exercise.id]);
  }

  static Future<List<Exercise>> readAllExercises() async {
    final db = await instance.database;
    final result = await db!.query(tableExercise);
    instance.close();
    return result.map((json) => Exercise.fromJson(json)).toList();
  }

  static Future<List<Exercise>> readAllExercisesByBodyPart(
      BodyPart bodyPart) async {
    final db = await instance.database;
    final result = await db!.query(tableExercise,
        where: '${ExerciseField.bodyPart} = ?', whereArgs: [bodyPart.id]);
    db.close();
    return result.map((json) => Exercise.fromJson(json)).toList();
  }
}
