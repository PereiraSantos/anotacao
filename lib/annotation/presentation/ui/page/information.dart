import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../domain/entities/annotation.dart';
import '../../controller/annotation_controller.dart';

// ignore: must_be_immutable
class Information extends StatelessWidget {

  final AnnotationEntity? annotationEntity;
   int? id;
  final AnnotationController controller = GetIt.I.get<AnnotationController>();

  Information({Key? key, this.annotationEntity}) : super(key: key){
      if (annotationEntity != null) {
      controller.updateValue(annotationEntity!.text!);
      id = annotationEntity!.id!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(66, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(66, 0, 0, 0),
        actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 15, bottom: 10),
              child: TextButton(
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white)
                  )
                )
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text(
                      id != null ? 'EDITAR':'SALVAR',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'helvetica_neue_light',
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
              ),
              onPressed: () {
                  if (controller.validateInput(id, context)) {
                      Navigator.of(context).pop();
                    }
              },
          ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: controller.formKey,
          child: TextFormField(
            controller: controller.textController,
            maxLines: 100,
            style: const TextStyle(fontSize: 22, color: Colors.white),
            decoration:  InputDecoration(
              border: InputBorder.none,
              hintText: 'Descrição aqui.',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 22.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            }
          ),
        ),
      ),
    );
  }
}