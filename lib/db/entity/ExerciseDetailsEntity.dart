import 'package:my_progression_mobile/model/ExerciseDetails.dart';

import '../DatabaseCreator.dart';

class ExerciseDetailsEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<ExerciseDetails> create(ExerciseDetails exerciseDetails) async {
    final db = await instance.database;
    final id = await db!.insert(tableExerciseDetails, exerciseDetails.toJson());
    instance.close();
    return exerciseDetails.copy(id: id);
  }

  static Future<ExerciseDetails> readExerciseDetails(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableExerciseDetails,
        columns: ExerciseDetailsFields.values,
        where: '${ExerciseDetailsFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return ExerciseDetails.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableExerciseDetails,
        where: '${ExerciseDetailsFields.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(ExerciseDetails exerciseDetails) async {
    final db = await instance.database;
    return db!.update(tableExerciseDetails, exerciseDetails.toJson(),
        where: '${ExerciseDetailsFields.id} = ?',
        whereArgs: [exerciseDetails.id]);
  }

  static Future<List<ExerciseDetails>> readAllTrainings() async {
    final db = await instance.database;
    final result = await db!.query(tableExerciseDetails);
    instance.close();
    return result.map((json) => ExerciseDetails.fromJson(json)).toList();
  }
}
