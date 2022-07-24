import 'package:dartz/dartz.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';
import '../../../../core/exception/exception.dart';
import '../../../../core/provider/database/database.dart';
import '../../../../core/provider/database/database_connect.dart';
import '../get_annotation_datasource.dart';

class AnnotationDataSourceImp implements AnnotationDataSource {

  AppDatabase? database;

    Future<void> conectionDataBase() async {
    database = await DataBaseConnect.connection();
  }
  
  @override
  Future<Either<Exception, List<AnnotationEntity>>> getAnnotationDataSource() async {
    try{
      await conectionDataBase();
      return Right(await database!.annotationDao.findAllAnnotation());
    } catch (e){
      return Left(ExceptionDb());
    }
  }

  @override
  Future<Either<Exception, bool>> registerAnnotationDataSource(AnnotationEntity annotationEntity) async {
    try{
      await conectionDataBase();
      await database!.annotationDao.insertAnnotation(annotationEntity);
      return const Right(true);
    } catch (e){
      return Left(ExceptionDb());
    }
  }

  @override
  Future<Either<Exception, bool>> deleteAnnotationDataSource(int id) async {
    try {
      await database!.annotationDao.delete(id);
      return const Right(true);
    }catch (e){
      return Left(ExceptionDb());
    }
  }
  
  @override
  Future<Either<Exception, bool>> updateAnnotationDataSource(String text, int id) async {
      try {
      await database!.annotationDao.updateAnnotation(text, id);
      return const Right(true);
    }catch (e){
      return Left(ExceptionDb());
    }
  }
  
}