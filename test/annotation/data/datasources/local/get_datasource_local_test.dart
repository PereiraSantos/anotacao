import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_afazeres/annotation/data/datasources/get_annotation_datasource.dart';
import 'package:lista_de_afazeres/annotation/data/repositories/annotation_repository_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';
import 'package:lista_de_afazeres/core/exception/exception.dart';

import '../../../domain/usercase/annotation_usercase_test.dart';


class AnnotationDataSourceImp implements AnnotationDataSource {

List<AnnotationEntity> list = <AnnotationEntity> [
  AnnotationEntity(id: 1, text: "solid", dateText: '01/01/2022'),
  AnnotationEntity(id: 2, text: "solid revisão", dateText: '01/02/2022'),
  AnnotationEntity(id: 3, text: "solid revisão", dateText: '01/03/2022'),
];

  @override
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotationDataSource() async {
     try{
      return Right(list);
    } catch (e){
      return Left(ExceptionDb());
    }
  }

 @override
  Future<Either<Exception, bool>> registerAnnotationDataSource(AnnotationEntity annotationEntity) async {

    try{
      list.add(annotationEntity);
      return const Right(true);
    } catch (e){
      return Left(Exception("Error"));
    }
  }
  
  @override
  Future<Either<Exception, bool>> deleteAnnotationDataSource(int id) async {
    try{
      list.remove(id);
      return const Right(true);
    } catch (e){
      return Left(Exception("Error"));
    }
  }
  
  @override
  Future<Either<Exception, bool>> updateAnnotationDataSource(String text, int id) async {
    try{
      for(var i = 0; i < list.length; i++){
        if(list[i].text == text){
          
        }
      }
      return const Right(true);
    } catch (e){
      return Left(Exception("Error"));
    }
  
  }

}

main() {
  test("Espero que não retorne nulo", () async {
    AnnotationRepositoryImp getAnnotationRepositoryImpl =
      AnnotationRepositoryImp(AnnotationDataSourceImp());

    var result = await getAnnotationRepositoryImpl.getAnnotation();
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, isNotEmpty);
  
  });

  test("Espero que salve a anotação local", () async {
    AnnotationRepositoryImpl registerAnnotationRepositoryImpl =
      AnnotationRepositoryImpl();

    AnnotationEntity annotationEntity = AnnotationEntity(
      id: 1,
      text: "teste",
      dateText: "01/01/2022"
    );

    var result = await registerAnnotationRepositoryImpl.registerAnnotation(annotationEntity);
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, true);
  });

    test("Espero que remova um anotação local", () async {
    AnnotationRepositoryImpl registerAnnotationRepositoryImpl =
      AnnotationRepositoryImpl();


    var result = await registerAnnotationRepositoryImpl.deleteAnnotation(1);
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, true);
  });

      test("Espero que remova um anotação local", () async {
    AnnotationRepositoryImpl registerAnnotationRepositoryImpl =
      AnnotationRepositoryImpl();


    var result = await registerAnnotationRepositoryImpl.updateAnnotation("ss", 1);
    var resultRegister;

    result.fold((erro) => null, (success) => resultRegister = success);

    expect(resultRegister, true);
  });
}