import 'dart:js_util';

import 'package:flutter/material.dart';
import 'mockup/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'UBU APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> courses = [];

  void _incrementCounter() {
    setState(() {
      courses.add(randomCourse());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (BuildContext ctx, int i) {
          dynamic records = courses[i];
          String _subjectName = records[1];
          String _subjectCode = records[0].toString();
          String _teacherName = records[2];
          String _classroomImage = records[3];
          return ClassroomListItem(
              courseName: _subjectCode + " " + _subjectName,
              teacherName: _teacherName,
              backgroundImage: AssetImage(_classroomImage));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ClassroomListItem extends StatelessWidget {
  final String courseName;
  final String teacherName;
  final ImageProvider backgroundImage;

  const ClassroomListItem({
    required this.courseName,
    required this.teacherName,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Text(
            courseName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        minVerticalPadding: 18,
        subtitle:
            Text(teacherName, style: const TextStyle(color: Colors.white)),
        onTap: () {},
      ),
    );
  }
}
