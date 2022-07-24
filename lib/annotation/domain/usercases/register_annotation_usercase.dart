import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

abstract class RegisterAnnotationUserCase{
  Future<Either<Exception, bool>>registerAnnotation(AnnotationEntity annotationEntity);
}