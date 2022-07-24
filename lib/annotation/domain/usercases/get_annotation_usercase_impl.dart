import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';
import 'package:lista_de_afazeres/annotation/domain/repositories/annotation_repositoy.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/get_annotation_usercase.dart';

class GetAnnotationUserCaseImpl implements GetAnnotationUserCase {

  final AnnotationRepository _annotationRepository;

  GetAnnotationUserCaseImpl(this._annotationRepository);

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotation() async {
    return await _annotationRepository.getAnnotation();
  }

}