import 'package:get_it/get_it.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/delete_annotation_usercase_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/update_annotation_usercase_impl.dart';

import '../annotation/data/datasources/get_annotation_datasource.dart';
import '../annotation/data/datasources/local/annotation_datasource_impl.dart';
import '../annotation/data/repositories/annotation_repository_impl.dart';
import '../annotation/domain/repositories/annotation_repositoy.dart';
import '../annotation/domain/usercases/delete_annotation_usercase.dart';
import '../annotation/domain/usercases/get_annotation_usercase.dart';
import '../annotation/domain/usercases/get_annotation_usercase_impl.dart';
import '../annotation/domain/usercases/register_annotation_usercase.dart';
import '../annotation/domain/usercases/register_annotation_usercase_impl.dart';
import '../annotation/domain/usercases/update_annotation_usercase.dart';
import '../annotation/presentation/controller/annotation_controller.dart';
import '../annotation/store/annotation_store.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //Store
    getIt.registerSingleton<AnnotationStore>(AnnotationStore());

    //dataSource
    getIt.registerLazySingleton<AnnotationDataSource>(
        () => AnnotationDataSourceImp());

    //repository
    getIt.registerLazySingleton<AnnotationRepository>(
        () => AnnotationRepositoryImp(getIt()));

    //usercases
    getIt.registerLazySingleton<GetAnnotationUserCase>(
        () => GetAnnotationUserCaseImpl(getIt()));

    getIt.registerLazySingleton<RegisterAnnotationUserCase>(
        () => RegisterAnnotationUserCaseImpl(getIt()));

    getIt.registerLazySingleton<DeleteAnnotationUserCase>(
        () => DeleteAnnotationUserCaseImpl(getIt()));

    getIt.registerLazySingleton<UpdateAnnotationUserCase>(
        () => UpdateAnnotationUserCaseImpl(getIt()));

    //controller
    getIt.registerFactory<AnnotationController>(
        () => AnnotationController(getIt(), getIt(), getIt(), getIt(), getIt()));
  }
}
