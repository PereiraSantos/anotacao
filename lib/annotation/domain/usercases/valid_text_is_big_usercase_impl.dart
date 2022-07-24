import 'package:lista_de_afazeres/annotation/domain/usercases/valid_text_is_big_usercase.dart';

class ValidTextIsBigUserCaseImpl implements ValidTextIsBigUserCase {
    
  @override
  bool validTextIsBig(String value) {
     if (value.length > 100) return false;
     return true;
  }

}