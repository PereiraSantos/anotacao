import 'package:dartz/dartz.dart';

abstract class DeleteAnnotationUserCase {
  Future<Either<Exception, bool>> deleteAnotation(int id);
}