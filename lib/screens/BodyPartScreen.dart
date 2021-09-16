import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_progression_mobile/db/entity/BodyPartEntity.dart';
import 'package:my_progression_mobile/model/BodyPart.dart';
import 'package:my_progression_mobile/screens/ExerciseListScreen.dart';

class BodyPartScreen extends StatefulWidget {
  @override
  _BodyPartScreenState createState() => _BodyPartScreenState();
}

class _BodyPartScreenState extends State<BodyPartScreen> {
  late List<BodyPart> bodyPartList = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshBodyParts();
  }

  @override
  void dispose() {
    BodyPartEntity.instance.close();
    super.dispose();
  }

  Future refreshBodyParts() async {
    setState(() => isLoading = true);
    this.bodyPartList = await BodyPartEntity.readAllBodyParts();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: bodyPartList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.title),
                title: Text(bodyPartList.elementAt(index).name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseListScreen(
                          bodyPart: bodyPartList.elementAt(index)),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
