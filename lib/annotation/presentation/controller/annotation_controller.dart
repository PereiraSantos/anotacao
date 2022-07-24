import 'package:flutter/material.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/delete_annotation_usercase.dart';

import '../../../core/exception/exception.dart';
import '../../../core/provider/time/date_time.dart';
import '../../domain/entities/annotation.dart';
import '../../domain/usercases/get_annotation_usercase.dart';
import '../../domain/usercases/register_annotation_usercase.dart';
import '../../domain/usercases/update_annotation_usercase.dart';
import '../../store/annotation_store.dart';

class AnnotationController {
  final GetAnnotationUserCase _getAnnotationUserCase;
  final RegisterAnnotationUserCase _registerAnnotationUserCase;
  final DeleteAnnotationUserCase _deleteAnnotationUserCase;
  final UpdateAnnotationUserCase _updateAnnotationUserCase;
  final AnnotationStore _annotationStore;

  final formKey = GlobalKey<FormState>();

  final TextEditingController textController = TextEditingController();
  final TextEditingController textSearchController = TextEditingController();


  AnnotationController(
      this._getAnnotationUserCase,
      this._deleteAnnotationUserCase,
      this._registerAnnotationUserCase,
      this._updateAnnotationUserCase,
      this._annotationStore);

  Future<void> getAnnotation() async {
    var result = await _getAnnotationUserCase.getAnnotation();
    result.fold((error) => ExceptionList().errMsg(error),
        (sucess) => buildList(sucess));
  }

  buildList(List<AnnotationEntity> annotationEntity) {
    _annotationStore.updateList(annotationEntity);
  }

  bool validateInput(int? id, BuildContext context) {
    if (formKey.currentState!.validate()) {
      id != null ? updateAnnotationController(id, context):  insertAnnotation();
      return true;
    } else {
      return false;
    }
  }

  void insertAnnotation() async {
    var result =
        await _registerAnnotationUserCase.registerAnnotation(buildAnnotation());
    result.fold((error) => ExceptionInsert().errMsg(error),
        (sucess) => getAnnotation());
  }

  void deleteAnnotationController(int id, BuildContext context) async {
    var result = await _deleteAnnotationUserCase.deleteAnotation(id);
    result.fold((error) => ExceptionDelete().errMsg(error), (sucess) {
      message(context, "Excluido com sucesso!!!");
      getAnnotation();
    });
  }

  void updateAnnotationController(int id, BuildContext context) async{
    var result = await _updateAnnotationUserCase.updateAnotation(textController.text, id);
    result.fold((error) => ExceptionDelete().errMsg(error), (sucess) {
      message(context, "Atualizado com sucesso!!!");
      getAnnotation();
    });
  }

  void message(BuildContext context, String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  AnnotationEntity buildAnnotation() {
    return AnnotationEntity(
        text: textController.text,
        dateText: DateTimeUsercase.formatDate(DateTime.now()));
  }

  updateValue(String value){
    textController.text = value;
  }

  searchList(value){
    if(value != ""){
      buildList(_annotationStore.annotationEntity.where((element) => element.text!.toLowerCase().contains(value)).toList());
    } else {
      getAnnotation();
    }
  }
}
