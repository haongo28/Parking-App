import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/screens/car_page.dart';
import 'package:parking_app/screens/scanner.dart';

import 'VisionDetectorViews/text_detectorv2_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: CarPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Scanner()),
          );
        },
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.add),
      ),
    );
  }
}
