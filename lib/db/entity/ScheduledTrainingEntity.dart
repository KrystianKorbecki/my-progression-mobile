import 'package:my_progression_mobile/model/ScheduledTraining.dart';

import '../DatabaseCreator.dart';

class ScheduledTrainingEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<ScheduledTraining> create(
      ScheduledTraining scheduledTraining) async {
    final db = await instance.database;
    final id =
        await db!.insert(tableScheduledTraining, scheduledTraining.toJson());
    instance.close();
    return scheduledTraining.copy(id: id);
  }

  static Future<ScheduledTraining> readScheduledTraining(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableScheduledTraining,
        columns: ScheduledTrainingField.values,
        where: '${ScheduledTrainingField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return ScheduledTraining.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableScheduledTraining,
        where: '${ScheduledTrainingField.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(ScheduledTraining scheduledTraining) async {
    final db = await instance.database;
    return db!.update(tableScheduledTraining, scheduledTraining.toJson(),
        where: '${ScheduledTrainingField.id} = ?',
        whereArgs: [scheduledTraining.id]);
  }

  static Future<List<ScheduledTraining>> readAllScheduledTrainings() async {
    final db = await instance.database;
    final result = await db!.query(tableScheduledTraining);
    instance.close();
    return result.map((json) => ScheduledTraining.fromJson(json)).toList();
  }
}
