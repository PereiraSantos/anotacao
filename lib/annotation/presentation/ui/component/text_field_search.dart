import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/annotation_controller.dart';
import '../page/information.dart';
import '../../../../core/router/transitions_builder.dart';

// ignore: must_be_immutable
class TextFieldSearch extends StatelessWidget {
  AnnotationController controller = GetIt.I.get<AnnotationController>();

  TextFieldSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.78,
            child: Material(
              elevation: 4,
              shadowColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              child: TextFormField(
                controller: controller.textController,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Procurar...',
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  hintStyle: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 18),
                  fillColor: Colors.white30,
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      borderSide: BorderSide.none),
                ),
                style: const TextStyle(fontSize: 20),
                onChanged: (value){
                  controller.searchList(value);
                },
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            child: FloatingActionButton(
              backgroundColor:  Colors.white, 
                onPressed: () {
                  Navigator.of(context).push(
                        TransitionsBuilder.createRoute(
                          Information(),
                        ),
                      );
                },
                child: const Icon(Icons.add, color: Colors.black),
              ),
          ),
        ],
      ),
    );
  }
}
