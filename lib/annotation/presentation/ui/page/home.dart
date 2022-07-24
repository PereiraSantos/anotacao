import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../controller/annotation_controller.dart';
import '../component/list_annotation.dart';


// ignore: must_be_immutable
class Home extends StatelessWidget {
  AnnotationController controller = GetIt.I.get<AnnotationController>();

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 0, 0, 0),
      body: ListAnnotation(),
    );
  }
}