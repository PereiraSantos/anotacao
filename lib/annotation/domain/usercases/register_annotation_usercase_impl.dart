import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/register_annotation_usercase.dart';
import '../repositories/annotation_repositoy.dart';


class RegisterAnnotationUserCaseImpl implements RegisterAnnotationUserCase {

  final AnnotationRepository _annotationRepository;

  RegisterAnnotationUserCaseImpl(this._annotationRepository);

  @override
  Future<Either<Exception, bool>> registerAnnotation(AnnotationEntity annotationEntity) async {
    return await _annotationRepository.registerAnnotation(annotationEntity);
  }

}