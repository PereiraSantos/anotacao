import 'package:dartz/dartz.dart';

abstract class UpdateAnnotationUserCase {
  Future<Either<Exception, bool>> updateAnotation(String text, int id);
}