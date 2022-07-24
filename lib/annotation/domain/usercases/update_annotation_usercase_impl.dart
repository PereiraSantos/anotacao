import 'package:dartz/dartz.dart';

import '../repositories/annotation_repositoy.dart';
import 'update_annotation_usercase.dart';

class UpdateAnnotationUserCaseImpl implements UpdateAnnotationUserCase {

  final AnnotationRepository _annotationRepository;

  UpdateAnnotationUserCaseImpl(this._annotationRepository);

  @override
  Future<Either<Exception, bool>> updateAnotation(String text, int id) async {
    return await _annotationRepository.updateAnnotation(text, id);
  }

}