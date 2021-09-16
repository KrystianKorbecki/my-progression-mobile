import 'package:my_progression_mobile/db/DatabaseCreator.dart';
import 'package:my_progression_mobile/model/TrainingPlan.dart';

class TrainingPlanEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<TrainingPlan> create(TrainingPlan trainingPlan) async {
    final db = await instance.database;
    final id = await db!.insert(tableTrainingPlan, trainingPlan.toJson());
    instance.close();
    return trainingPlan.copy(id: id);
  }

  static Future<TrainingPlan> readTrainingPlan(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableTrainingPlan,
        columns: TrainingPlanField.values,
        where: '${TrainingPlanField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return TrainingPlan.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableTrainingPlan,
        where: '${TrainingPlanField.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(TrainingPlan trainingPlan) async {
    final db = await instance.database;
    return db!.update(tableTrainingPlan, trainingPlan.toJson(),
        where: '${TrainingPlanField.id} = ?', whereArgs: [trainingPlan.id]);
  }

  static Future<List<TrainingPlan>> readAllTrainings() async {
    final db = await instance.database;
    final result = await db!.query(tableTrainingPlan);
    instance.close();
    return result.map((json) => TrainingPlan.fromJson(json)).toList();
  }
}
