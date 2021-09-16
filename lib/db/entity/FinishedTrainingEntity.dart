import 'package:my_progression_mobile/model/FinishedTraining.dart';

import '../DatabaseCreator.dart';

class FinishedTrainingEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<FinishedTraining> create(
      FinishedTraining finishedTraining) async {
    final db = await instance.database;
    final id =
        await db!.insert(tableFinishedTraining, finishedTraining.toJson());
    instance.close();
    return finishedTraining.copy(id: id);
  }

  static Future<FinishedTraining> readFinishedTraining(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableFinishedTraining,
        columns: FinishedTrainingFields.values,
        where: '${FinishedTrainingFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return FinishedTraining.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableFinishedTraining,
        where: '${FinishedTrainingFields.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(FinishedTraining finishedTraining) async {
    final db = await instance.database;
    return db!.update(tableFinishedTraining, finishedTraining.toJson(),
        where: '${FinishedTrainingFields.id} = ?',
        whereArgs: [finishedTraining.id]);
  }

  static Future<List<FinishedTraining>> readAllFinishedTrainings() async {
    final db = await instance.database;
    final result = await db!.query(tableFinishedTraining);
    instance.close();
    return result.map((json) => FinishedTraining.fromJson(json)).toList();
  }
}
