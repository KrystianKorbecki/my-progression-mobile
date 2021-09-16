import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_progression_mobile/db/entity/TrainingPlanEntity.dart';
import 'package:my_progression_mobile/model/TrainingPlan.dart';
import 'package:my_progression_mobile/screens/BodyPartScreen.dart';

class CreateTrainingPlanScreen extends StatefulWidget {
  @override
  _CreateTrainingPlanScreenState createState() =>
      _CreateTrainingPlanScreenState();
}

class _CreateTrainingPlanScreenState extends State<CreateTrainingPlanScreen> {
  final trainingNameController = TextEditingController();
  final trainingDescriptionController = TextEditingController();

  late TrainingPlan newTrainingPlan;

  @override
  void dispose() {
    trainingNameController.dispose();
    trainingDescriptionController.dispose();
    super.dispose();
  }

  void createTrainingPlan() {
    newTrainingPlan = new TrainingPlan(
        name: trainingNameController.text,
        description: trainingDescriptionController.text,
        nextTrainingPlan: 0);
    TrainingPlanEntity.create(newTrainingPlan);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Create new training plan"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.navigate_next_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BodyPartScreen()),
                );
              })
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.title),
            title: new TextField(
              controller: trainingNameController,
              decoration: new InputDecoration(
                hintText: "Training name",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.description),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Description",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
