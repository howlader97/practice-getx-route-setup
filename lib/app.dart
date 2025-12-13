import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/screen/post_data.dart';

class DataGetApp extends StatelessWidget {
  const DataGetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PostData(),
    );
  }
}