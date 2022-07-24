import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

abstract class AnnotationDataSource {
  Future<Either<Exception, List<AnnotationEntity>>>  getAnnotationDataSource();
  Future<Either<Exception, bool>> registerAnnotationDataSource(AnnotationEntity annotationEntity);
  Future<Either<Exception, bool>> deleteAnnotationDataSource(int id);
  Future<Either<Exception, bool>> updateAnnotationDataSource(String text, int id);
}