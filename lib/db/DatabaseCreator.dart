import 'package:my_progression_mobile/model/AerobicExercise.dart';
import 'package:my_progression_mobile/model/BodyPart.dart';
import 'package:my_progression_mobile/model/Exercise.dart';
import 'package:my_progression_mobile/model/ExerciseDetails.dart';
import 'package:my_progression_mobile/model/FinishedTraining.dart';
import 'package:my_progression_mobile/model/FinishedTrainingExercise.dart';
import 'package:my_progression_mobile/model/ScheduledTraining.dart';
import 'package:my_progression_mobile/model/TrainingPlan.dart';
import 'package:my_progression_mobile/model/TypeOfExercise.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseCreator {
  static final DatabaseCreator instance = DatabaseCreator._init();
  static final String DATABASE_NAME = 'my_progression.db';
  static final int DATABASE_VERSION = 1;

  static Database? _database;

  DatabaseCreator._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB(DATABASE_NAME);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    print(dbPath);
    final path = dbPath + filePath;

    return await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $tableBodyPart (
        ${BodyPartField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${BodyPartField.name} TEXT NOT NULL
      );''');
    await db.execute('''
     CREATE TABLE $tableTrainingPlan (
        ${TrainingPlanField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TrainingPlanField.nextTrainingPlan} INTEGER,
        ${TrainingPlanField.name} TEXT NOT NULL,
        ${TrainingPlanField.description} TEXT,
        FOREIGN KEY(${TrainingPlanField.nextTrainingPlan}) REFERENCES  $tableTrainingPlan(${TrainingPlanField.id})
      );''');

    await db.execute('''
      CREATE TABLE $tableTypeOfExercise (
        ${TypeOfExerciseField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TypeOfExerciseField.name} TEXT NOT NULL
      );''');

    await db.execute('''
      INSERT INTO $tableTypeOfExercise(${TypeOfExerciseField.name}) VALUES ('Strength'), ('Aerobic');
      ''');

    await db.execute('''
      INSERT INTO $tableBodyPart (${BodyPartField.name}) 
      VALUES ('Chest'), ('Traps'), ('Shoulders'), ('Triceps'), ('Biceps'),('Forearm'), ('Abs'), ('Back'), 
      ('Lower Back'), ('Butt'), ('Quads'), ('Calves'), ('Hamstrings');
      ''');

    await db.execute('''
      CREATE TABLE $tableExercise(
        ${ExerciseField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ExerciseField.typeOfExercise} INTEGER NOT NULL,
        ${ExerciseField.bodyPart} INTEGER NOT NULL,
        ${ExerciseField.name} TEXT NOT NULL,
        ${ExerciseField.gifPath} TEXT,
        ${ExerciseField.photoPath} TEXT,
        ${ExerciseField.description} TEXT,
        FOREIGN KEY(${ExerciseField.typeOfExercise}) REFERENCES $tableTypeOfExercise(${TypeOfExerciseField.id}),
        FOREIGN KEY(${ExerciseField.bodyPart}) REFERENCES $tableBodyPart(${BodyPartField.id}));
        ''');

    await db.execute('''
      INSERT INTO $tableExercise(${ExerciseField.typeOfExercise}, ${ExerciseField.bodyPart}, ${ExerciseField.name})
      VALUES (1, 1, 'Bench press'), (1, 1, 'Squat');
    ''');

    await db.execute('''
      CREATE TABLE $tableAerobicExercise (
        ${AerobicExerciseField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${AerobicExerciseField.distance} TEXT,
        ${AerobicExerciseField.maxSpeed} TEXT,
        ${AerobicExerciseField.avgSpeed} TEXT,
        ${AerobicExerciseField.minSpeed} TEXT
      );''');

    await db.execute('''
      CREATE TABLE $tableExerciseDetails (
        ${ExerciseDetailsFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ExerciseDetailsFields.aerobicExercise} INTEGER,
        ${ExerciseDetailsFields.calories} TEXT,
        ${ExerciseDetailsFields.duration} TEXT,
        ${ExerciseDetailsFields.note} TEXT,
        ${ExerciseDetailsFields.repeat} TEXT,
        ${ExerciseDetailsFields.rest} TEXT,
        FOREIGN KEY(${ExerciseDetailsFields.aerobicExercise}) REFERENCES $tableAerobicExercise( ${AerobicExerciseField.id})
      );''');

    await db.execute('''
      CREATE TABLE $tableScheduledTraining (
        ${ScheduledTrainingField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ScheduledTrainingField.nextExercise} INTEGER,
        ${ScheduledTrainingField.exercise} INTEGER,
        ${ScheduledTrainingField.scheduledTrainingPlan} INTEGER,
        ${ScheduledTrainingField.exerciseDetails} INTEGER,
        FOREIGN KEY (${ScheduledTrainingField.nextExercise}) REFERENCES  $tableScheduledTraining(${ScheduledTrainingField.id}), 
        FOREIGN KEY (${ScheduledTrainingField.exercise}) REFERENCES $tableExercise(${ExerciseField.id}),
        FOREIGN KEY (${ScheduledTrainingField.scheduledTrainingPlan}) REFERENCES $tableTrainingPlan(${TrainingPlanField.id}),
        FOREIGN KEY (${ScheduledTrainingField.exerciseDetails}) REFERENCES $tableExerciseDetails(${ExerciseDetailsFields.id})
      );''');

    await db.execute('''
      CREATE TABLE $tableFinishedTraining (
        ${FinishedTrainingFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${FinishedTrainingFields.scheduledTrainingPlan} INTEGER,
        ${FinishedTrainingFields.note} TEXT,
        ${FinishedTrainingFields.finishDate} TEXT,
        ${FinishedTrainingFields.durationSecond} INTEGER,
        FOREIGN KEY (${FinishedTrainingFields.scheduledTrainingPlan}) REFERENCES $tableTrainingPlan(${TrainingPlanField.id})
      );''');

    await db.execute('''
      CREATE TABLE $tableFinishedTrainingExercise (
        ${FinishedTrainingExerciseFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${FinishedTrainingExerciseFields.exerciseDetails} INTEGER,
        ${FinishedTrainingExerciseFields.finishedTraining} INTEGER,
        ${FinishedTrainingExerciseFields.scheduledTrainingExercise} INTEGER,
        FOREIGN KEY (${FinishedTrainingExerciseFields.exerciseDetails}) REFERENCES $tableExerciseDetails(${ExerciseDetailsFields.id}),
        FOREIGN KEY (${FinishedTrainingExerciseFields.finishedTraining}) REFERENCES $tableFinishedTraining(${FinishedTrainingFields.id}),
        FOREIGN KEY (${FinishedTrainingExerciseFields.scheduledTrainingExercise}) REFERENCES $tableScheduledTraining(${ScheduledTrainingField.id})
      );
     ''');
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    db!.close();
  }
}
