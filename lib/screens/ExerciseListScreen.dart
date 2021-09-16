import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_progression_mobile/db/entity/ExerciseEntity.dart';
import 'package:my_progression_mobile/model/BodyPart.dart';
import 'package:my_progression_mobile/model/Exercise.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({Key? key, required this.bodyPart})
      : super(key: key);

  final BodyPart bodyPart;

  @override
  _ExerciseListScreenState createState() =>
      _ExerciseListScreenState(bodyPart: bodyPart);
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  _ExerciseListScreenState({required this.bodyPart});

  final BodyPart bodyPart;

  late List<Exercise> exerciseList = List.empty();
  bool isLoading = false;
  List<bool> isSelected = [true, false, false];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int seriesCount = 1;

  @override
  void initState() {
    super.initState();
    refreshExerciseList();
  }

  @override
  void dispose() {
    ExerciseEntity.instance.close();
    super.dispose();
  }

  Future refreshExerciseList() async {
    setState(() => isLoading = true);
    this.exerciseList =
        await ExerciseEntity.readAllExercisesByBodyPart(bodyPart);
    setState(() => isLoading = false);
  }

  void addSeriesCount() {
    seriesCount++;
  }

  void subtractSeriesCount() {
    seriesCount--;
    if (seriesCount < 1) seriesCount = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: exerciseList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.title),
                  title: Text(exerciseList.elementAt(index).name),
                  trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () async {
                        return await buildShowDialog(
                            context, exerciseList.elementAt(index).name);
                      }));
            }),
      ),
    );
  }

  Future<void> buildShowDialog(BuildContext context, String exerciseName) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ToggleButtons(
                        children: <Widget>[
                          Icon(Icons.format_bold),
                          Icon(Icons.format_italic),
                          Icon(Icons.link),
                        ],
                        isSelected: isSelected,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = false;
                            }
                            isSelected[index] = true;
                          });
                        },
                      ),
                      Container(
                        width: 250,
                        height: 150,
                        child: ListView.builder(
                            itemCount: seriesCount,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Text((index + 1).toString()),
                                  Icon(Icons.ac_unit),
                                  Container(
                                    width: 70,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "Enter weight";
                                      },
                                      decoration:
                                          InputDecoration(hintText: "50"),
                                    ),
                                  ),
                                  Text("kg  "),
                                  Icon(Icons.loop_outlined),
                                  Container(
                                    width: 60,
                                    child: TextFormField(
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "Enter reps";
                                      },
                                      decoration:
                                          InputDecoration(hintText: "8"),
                                    ),
                                  ),
                                  Text("x"),
                                ],
                              );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  addSeriesCount();
                                });
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  subtractSeriesCount();
                                });
                              },
                              icon: Icon(Icons.remove_outlined)),
                        ],
                      )
                    ],
                  )),
              title: Text(exerciseName),
              actions: <Widget>[
                InkWell(
                  child: Text('Dodaj'),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

//   AlertDialog showDialog(BuildContext context) {
//     return AlertDialog(
//         context: context,
//         title: "LOGIN",
//         content: Container(
//           width: 250,
//           height: 300,
//           child: Column(
//             children: <Widget>[
//               ToggleButtons(
//                 children: <Widget>[
//                   Icon(Icons.format_bold),
//                   Icon(Icons.format_italic),
//                   Icon(Icons.link),
//                 ],
//                 isSelected: isSelected,
//                 onPressed: (int index) {
//                   setState(() {
//                     isSelected[index] = !isSelected[index];
//                   });
//                 },
//               ),
//               Container(
//   //               width: 250,
//   //               child: ListView.builder(
//   //                 itemCount: exerciseList.length,
//   //                 itemBuilder: (BuildContext context, int index)
//   //                 {
//   //                 return ListTile(
//   //                     title: Row(
//   //                       children: [
//   //                         Icon(Icons.add),
//   //                         Container(
//   //                           width: 60,
//   //                           child: TextField( decoration: const InputDecoration(
//   //                               border: OutlineInputBorder(),
//   //                               hintText: '50'
//   //                           ),),
//   //                         ),
//   //                         Text("kg"),
//   //                         Icon(Icons.hourglass_empty_outlined),
//   //                         Container(
//   //                           width: 60,
//   //                           child: TextField( decoration: const InputDecoration(
//   //                               border: OutlineInputBorder(),
//   //                               hintText: '50'
//   //                           ),),
//   //                         ),
//   //                         Text("s")
//   //                       ],
//   //                     )
//   //                 );
//   //               },
//   //                 scrollDirection: Axis.vertical,
//   //                 shrinkWrap: true,
//   //               ),
//   //             )
//   //           ],
//   //         ),
//   //       ),
//   //       buttons: [
//   //         DialogButton(
//   //           onPressed: () => Navigator.pop(context),
//   //           child: Text(
//   //             "LOGIN",
//   //             style: TextStyle(color: Colors.white, fontSize: 20),
//   //           ),
//   //         )
//   //       ]);
//   // }
//
}
