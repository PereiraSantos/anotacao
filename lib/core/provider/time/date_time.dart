import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


class DateTimeUsercase {

  static getTypeDate(){
    initializeDateFormatting();
    Intl.defaultLocale = 'pt_BR';
  }

  static String formatDate(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

  static String formatDateWek(String date) {
    getTypeDate();
    return DateFormat("EEEE - MMMM").format(dateParse(date)).replaceAll("-feira", "");
  }

  static DateTime dateParse(String date) => DateFormat('dd/MM/yyyy').parse(date);
}