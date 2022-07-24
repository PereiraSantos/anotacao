import 'package:mobx/mobx.dart';

import '../domain/entities/annotation.dart';
part 'annotation_store.g.dart';

class AnnotationStore = AnnotationBase with _$AnnotationStore;

abstract class AnnotationBase with Store{

  @observable
  ObservableList<AnnotationEntity> annotationEntity = ObservableList<AnnotationEntity>.of([]);

  @observable
  String toDo = '';

  @action
  void updateList(List<AnnotationEntity> annotationEntityList) {
    annotationEntity.clear();
    annotationEntity.addAll(annotationEntityList);
  }

 }