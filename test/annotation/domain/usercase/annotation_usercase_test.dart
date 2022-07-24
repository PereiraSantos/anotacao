import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_afazeres/annotation/data/dto/annotation_dto.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';
import 'package:lista_de_afazeres/annotation/domain/repositories/annotation_repositoy.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/delete_annotation_usercase_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/get_annotation_usercase_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/register_annotation_usercase_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/update_annotation_usercase_impl.dart';

class AnnotationRepositoryImpl implements AnnotationRepository {

  List<AnnotationDto> list = [
    AnnotationDto(texto: "teste", dataTexto: "01/01/2022"),
    AnnotationDto(texto: "teste1", dataTexto: "01/02/2022"),
  ];

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotation() async {
    try{
      return Right(list);
    } catch (e) {
      return Left(Exception("error"));
    }
  }

  @override
  Future<Either<Exception, bool>> registerAnnotation(AnnotationEntity annotationEntity) async {
    try{
      return const Right(true);
    }catch(e){
      return Left(Exception("Error"));
    }
  }
  
  @override
  Future<Either<Exception, bool>> deleteAnnotation(int id) async {
   try {
    return  const Right(true);
   } catch (e){
     return Left(Exception("Error"));
   }
  }
  
  @override
  Future<Either<Exception, bool>> updateAnnotation(String text, int id) async {
   try {
    return  const Right(true);
   } catch (e){
     return Left(Exception("Error"));
   }
  } 

}

void main() {
  test("Espero uma anotação",() async {

    GetAnnotationUserCaseImpl getAnnotationUserCaseImpl = GetAnnotationUserCaseImpl(AnnotationRepositoryImpl());

    var result = await getAnnotationUserCaseImpl.getAnnotation();

    List<AnnotationEntity>? resultAnnotation = <AnnotationEntity>[];

    result.fold((error) => null, (success) => resultAnnotation = success);

    expect(resultAnnotation, isNotNull);

  });

  test("Espero que salve a anotação", () async {
    RegisterAnnotationUserCaseImpl registerAnnotationImpl =
      RegisterAnnotationUserCaseImpl(AnnotationRepositoryImpl());

    AnnotationEntity annotationEntity = AnnotationEntity(
      id: 1,
      text: "teste",
      dateText: "01/01/2022"
    );

    var result = await registerAnnotationImpl.registerAnnotation(annotationEntity);
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, true);
  });

    test("Espero que delete uma  anotação", () async {
    DeleteAnnotationUserCaseImpl deleteAnnotationImpl =
      DeleteAnnotationUserCaseImpl(AnnotationRepositoryImpl());

    var result = await deleteAnnotationImpl.deleteAnotation(1);
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, true);
  });

   test("Espero que atualize uma anotação", () async {
    UpdateAnnotationUserCaseImpl deleteAnnotationImpl =
      UpdateAnnotationUserCaseImpl(AnnotationRepositoryImpl());

    var result = await deleteAnnotationImpl.updateAnotation("ssss", 1);
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, true);
  });


}