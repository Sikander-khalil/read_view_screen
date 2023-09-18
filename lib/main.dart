import 'package:flutter/material.dart';
import 'package:pratice_app/video_shorts_ui.dart';

import 'PdfScreen.dart';
import 'bottom_sheet.dart';
import 'rooted_tree.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FileList(),


    );
  }
}
