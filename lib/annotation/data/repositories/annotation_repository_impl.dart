import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

import '../../domain/repositories/annotation_repositoy.dart';
import '../datasources/get_annotation_datasource.dart';

class AnnotationRepositoryImp implements AnnotationRepository {

  final AnnotationDataSource _annotationDataSource;

  AnnotationRepositoryImp(this._annotationDataSource);

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotation() async {
    return await _annotationDataSource.getAnnotationDataSource();
  }

   @override
  Future<Either<Exception, bool>> registerAnnotation(AnnotationEntity annotationEntity) async {
    return _annotationDataSource.registerAnnotationDataSource(annotationEntity);
  }
  
  @override
  Future<Either<Exception, bool>> deleteAnnotation(int id) async{
    return await _annotationDataSource.deleteAnnotationDataSource(id);
  }
  
  @override
  Future<Either<Exception, bool>> updateAnnotation(String text, int id) async {
    return await _annotationDataSource.updateAnnotationDataSource(text, id);
  }

}