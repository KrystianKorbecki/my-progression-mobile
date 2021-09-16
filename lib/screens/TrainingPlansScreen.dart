import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_progression_mobile/db/entity/TrainingPlanEntity.dart';
import 'package:my_progression_mobile/model/TrainingPlan.dart';
import 'package:my_progression_mobile/widgets/training_plan_widget.dart';

class TrainingPlans extends StatefulWidget {
  @override
  _TrainingPlansState createState() => _TrainingPlansState();
}

class _TrainingPlansState extends State<TrainingPlans> {
  late List<TrainingPlan> trainingPlanList = [
    TrainingPlan(nextTrainingPlan: -1, name: 'Trening', description: 'Opis')
  ];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshTrainings();
  }

  @override
  void dispose() {
    TrainingPlanEntity.instance.close();

    super.dispose();
  }

  Future refreshTrainings() async {
    setState(() => isLoading = true);
    this.trainingPlanList = await TrainingPlanEntity.readAllTrainings();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: ListView.builder(
            itemCount: trainingPlanList.length,
            itemBuilder: (BuildContext context, int index) {
              return TrainingPlanWidget(
                  context, trainingPlanList.elementAt(index).name);
            }),
      ),
    );
  }
}
