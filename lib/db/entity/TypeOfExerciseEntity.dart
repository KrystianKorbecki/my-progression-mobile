import 'package:my_progression_mobile/model/TypeOfExercise.dart';

import '../DatabaseCreator.dart';

class TypeOfExerciseEntity {
  static final DatabaseCreator instance = DatabaseCreator.instance;

  static Future<TypeOfExercise> create(TypeOfExercise typeOfExercise) async {
    final db = await instance.database;
    final id = await db!.insert(tableTypeOfExercise, typeOfExercise.toJson());
    instance.close();
    return typeOfExercise.copy(id: id);
  }

  static Future<TypeOfExercise> readTypeOfExercise(int id) async {
    final db = await instance.database;

    final maps = await db!.query(tableTypeOfExercise,
        columns: TypeOfExerciseField.values,
        where: '${TypeOfExerciseField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return TypeOfExercise.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(tableTypeOfExercise,
        where: '${TypeOfExerciseField.id} = ?', whereArgs: [id]);
  }

  static Future<int> update(TypeOfExercise typeOfExercise) async {
    final db = await instance.database;
    return db!.update(tableTypeOfExercise, typeOfExercise.toJson(),
        where: '${TypeOfExerciseField.id} = ?', whereArgs: [typeOfExercise.id]);
  }

  static Future<List<TypeOfExercise>> readAllTypeOfExercises() async {
    final db = await instance.database;
    final result = await db!.query(tableTypeOfExercise);
    instance.close();
    return result.map((json) => TypeOfExercise.fromJson(json)).toList();
  }
}
