import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import '../../../annotation/domain/entities/annotation.dart';
import '../dao/annotation_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [AnnotationEntity])
abstract class AppDatabase extends FloorDatabase {
  AnnotationDao get annotationDao;
}