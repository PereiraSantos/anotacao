import 'database.dart';

abstract class DataBaseConnect {

  static Future<AppDatabase> connection() async => await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}