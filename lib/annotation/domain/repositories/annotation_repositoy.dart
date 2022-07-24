import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

abstract class AnnotationRepository {
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotation();
  Future<Either<Exception, bool>> registerAnnotation(AnnotationEntity annotationEntity);
  Future<Either<Exception, bool>> deleteAnnotation(int id);
  Future<Either<Exception, bool>> updateAnnotation(String text, int id);
}