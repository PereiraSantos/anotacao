import 'package:floor/floor.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

@dao
abstract class AnnotationDao {

  @Query('select * from annotation')
  Future<List<AnnotationEntity>> findAllAnnotation();

  @Query('SELECT * FROM annotation WHERE id = :id')
  Future<AnnotationEntity?> findAnnotationById(int id);

  @insert
  Future<void> insertAnnotation(AnnotationEntity annotationEntity);

  @Query('update annotation set text = :text WHERE id = :id')
  Future<void> updateAnnotation(String text, int id);

  @Query('update annotation set date_text = :data WHERE id = :id')
  Future<void> updateAnnotationData(String data, int id);

  @Query('update annotation set text = :time WHERE id = :id')
  Future<void> updateAnnotationTime(String time, int id);

  @Query('delete from annotation where id = :id')
  Future<void> delete(int id);
}