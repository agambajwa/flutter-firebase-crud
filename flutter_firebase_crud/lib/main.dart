import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      accentColor: Colors.redAccent
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String studentName, studentRegNo, studentBranch;
  double studentCGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentRegNum(regNum) {
    this.studentRegNo = regNum;
  }

  getStudentBranch(branch) {
    this.studentBranch = branch;
  }

  getStudentCGPA(cgpa) {
    this.studentCGPA = double.parse(cgpa);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase CRUD College DB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.black54,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0
                    )
                  )
                ),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Registration Number",
                    fillColor: Colors.black54,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String regNum) {
                  getStudentRegNum(regNum);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Branch/Course",
                    fillColor: Colors.black54,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String branch) {
                  getStudentBranch(branch);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "CGPA",
                    fillColor: Colors.black54,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0
                        )
                    )
                ),
                onChanged: (String cgpa) {
                  getStudentCGPA(cgpa);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Create"),
                    textColor: Colors.white,
                    onPressed: (){
                      createData();
                    },
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Read"),
                    textColor: Colors.white,
                    onPressed: (){
                      readData();
                    },
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Update"),
                    textColor: Colors.white,
                    onPressed: (){
                      updateData();
                    },
                  ),
                  RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("Delete"),
                    textColor: Colors.red,
                    onPressed: (){
                      deleteData();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: Text("Name"),
                  ),
                  Expanded(
                    child: Text("Registration Number"),
                  ),
                  Expanded(
                    child: Text("Branch"),
                  ),
                  Expanded(
                    child: Text("CGPA"),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection("Students").snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(documentSnapshot["studentName"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studentRegNo"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studentBranch"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studentCGPA"].toString()),
                            ),
                          ],
                        );
                  });
                }
                return Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void deleteData() {
    DocumentReference documentReference = Firestore.instance.collection("Students").document(studentName);
    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }

  void updateData() {
    DocumentReference documentReference = Firestore.instance.collection("Students").document(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentRegNo": studentRegNo,
      "studentBranch": studentBranch,
      "studentCGPA": studentCGPA,
    };
    documentReference.setData(students).whenComplete(() {
      print("$studentName updated");
    });
  }

  void readData() {
    DocumentReference documentReference = Firestore.instance.collection("Students").document(studentName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["studentName"]);
      print(datasnapshot.data["studentRegNo"]);
      print(datasnapshot.data["studentBranch"]);
      print(datasnapshot.data["studentCGPA"]);
    });
  }

  void createData() {
    DocumentReference documentReference = Firestore.instance.collection("Students").document(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentRegNo": studentRegNo,
      "studentBranch": studentBranch,
      "studentCGPA": studentCGPA,
    };
    documentReference.setData(students).whenComplete(() {
      print("$studentName created");
    });
  }
}
