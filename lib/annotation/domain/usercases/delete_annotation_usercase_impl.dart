import 'package:dartz/dartz.dart';

import '../repositories/annotation_repositoy.dart';
import 'delete_annotation_usercase.dart';

class DeleteAnnotationUserCaseImpl implements DeleteAnnotationUserCase {

  final AnnotationRepository _annotationRepository;

  DeleteAnnotationUserCaseImpl(this._annotationRepository);

  @override
  Future<Either<Exception, bool>> deleteAnotation(int id) async {
    return await _annotationRepository.deleteAnnotation(id);
  }

}