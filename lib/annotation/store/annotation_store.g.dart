// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnnotationStore on AnnotationBase, Store {
  late final _$annotationEntityAtom =
      Atom(name: 'AnnotationBase.annotationEntity', context: context);

  @override
  ObservableList<AnnotationEntity> get annotationEntity {
    _$annotationEntityAtom.reportRead();
    return super.annotationEntity;
  }

  @override
  set annotationEntity(ObservableList<AnnotationEntity> value) {
    _$annotationEntityAtom.reportWrite(value, super.annotationEntity, () {
      super.annotationEntity = value;
    });
  }

  late final _$toDoAtom = Atom(name: 'AnnotationBase.toDo', context: context);

  @override
  String get toDo {
    _$toDoAtom.reportRead();
    return super.toDo;
  }

  @override
  set toDo(String value) {
    _$toDoAtom.reportWrite(value, super.toDo, () {
      super.toDo = value;
    });
  }

  late final _$AnnotationBaseActionController =
      ActionController(name: 'AnnotationBase', context: context);

  @override
  void updateList(List<AnnotationEntity> annotationEntityList) {
    final _$actionInfo = _$AnnotationBaseActionController.startAction(
        name: 'AnnotationBase.updateList');
    try {
      return super.updateList(annotationEntityList);
    } finally {
      _$AnnotationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
annotationEntity: ${annotationEntity},
toDo: ${toDo}
    ''';
  }
}
