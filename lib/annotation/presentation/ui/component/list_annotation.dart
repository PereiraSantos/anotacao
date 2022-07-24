
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:lista_de_afazeres/annotation/presentation/ui/component/text_list.dart';
import '../../../../core/provider/time/date_time.dart';
import '../../../store/annotation_store.dart';
import '../../controller/annotation_controller.dart';
import '../page/information.dart';
import 'text_field_search.dart';
import '../../../../core/router/transitions_builder.dart';

// ignore: must_be_immutable
class ListAnnotation extends StatelessWidget {
  AnnotationStore annotationStore = GetIt.I.get<AnnotationStore>();
  AnnotationController controller = GetIt.I.get<AnnotationController>();

  ListAnnotation({Key? key}) : super(key: key) {
    controller.getAnnotation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: TextFieldSearch(),
        ),
        Flexible(
          child: Observer(
            builder: (context) => ListView.builder(
              itemCount: annotationStore.annotationEntity.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.endToStart) {
                      Navigator.of(context).push(
                        TransitionsBuilder.createRoute(
                          Information(annotationEntity: annotationStore.annotationEntity[index]),
                        ),
                      );                      
                    } else {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                              "Deseja excluir?",
                              style: TextStyle(color: Colors.black45, fontSize: 20),
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,right: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        controller.deleteAnnotationController(
                                            annotationStore.annotationEntity[index].id!,
                                            context);
                                        Navigator.of(context).pop(true);
                                      },
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                          const BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(80, 0, 0, 0)),
                                        ),
                                        foregroundColor: MaterialStateProperty.all(
                                           const Color.fromARGB(80, 0, 0, 0)),
                                        padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 40),
                                        ),
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      child: const Text("SIM"),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                          const BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(80, 0, 0, 0)),
                                        ),
                                        foregroundColor: MaterialStateProperty.all(
                                            const Color.fromARGB(80, 0, 0, 0)),
                                        padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 40),
                                        ),
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      child: const Text("NÃO"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    return null;
                  },
                  background: Container(
                    color:  Colors.black,
                    child: const Align(
                      alignment: Alignment(-0.9, 0),
                      child: Icon(Icons.delete, color: Colors.red, size: 30),
                    ),
                  ),
                  secondaryBackground: Container(
                    color:  Colors.black,
                    child: const Align(
                      alignment: Alignment(0.9, 0),
                      child: Icon(Icons.edit, color: Colors.blue, size: 30,),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Card(
                      elevation: 8,
                      shape: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide.none),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextList(annotationStore.annotationEntity[index].text ?? ""),
                            ],
                          ),
                          TextList.date(DateTimeUsercase.formatDateWek(
                              annotationStore.annotationEntity[index].dateText ?? "")),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}