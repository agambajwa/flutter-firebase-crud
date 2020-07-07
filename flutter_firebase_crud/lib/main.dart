import 'package:flutter/material.dart';

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

  String studentName, studentRegNum, studentBranch;
  double studentCGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentRegNum(regNum) {
    this.studentRegNum = regNum;
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
            )
          ],
        ),
      ),
    );
  }

  void deleteData() {
    print('deleted');}

  void updateData() {
    print('updated');}

  void readData() {
    print('read');}

  void createData() {
    print('created');
  }
}
