import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

abstract class  GetAnnotationUserCase {
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotation();
}