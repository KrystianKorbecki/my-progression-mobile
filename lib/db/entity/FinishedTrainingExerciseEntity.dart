import 'package:my_progression_mobile/model/FinishedTrainingExercise.dart';

import '../DatabaseCreator.dart';

class FinishedTrainingExerciseEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<FinishedTrainingExercise> create(
      FinishedTrainingExercise finishedTrainingExercise) async {
    final db = await instance.database;
    final id = await db!.insert(
        tableFinishedTrainingExercise, finishedTrainingExercise.toJson());
    instance.close();
    return finishedTrainingExercise.copy(id: id);
  }

  static Future<FinishedTrainingExercise> readFinishedTrainingExercise(
      int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableFinishedTrainingExercise,
        columns: FinishedTrainingExerciseFields.values,
        where: '${FinishedTrainingExerciseFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return FinishedTrainingExercise.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableFinishedTrainingExercise,
        where: '${FinishedTrainingExerciseFields.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(
      FinishedTrainingExercise finishedTrainingExercise) async {
    final db = await instance.database;
    return db!.update(
        tableFinishedTrainingExercise, finishedTrainingExercise.toJson(),
        where: '${FinishedTrainingExerciseFields.id} = ?',
        whereArgs: [finishedTrainingExercise.id]);
  }

  static Future<List<FinishedTrainingExercise>>
      readAllFinishedTrainings() async {
    final db = await instance.database;
    final result = await db!.query(tableFinishedTrainingExercise);
    instance.close();
    return result
        .map((json) => FinishedTrainingExercise.fromJson(json))
        .toList();
  }
}
