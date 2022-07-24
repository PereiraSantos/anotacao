import 'valid_text_is_null_usercase.dart';

class ValidTextIsNullUserCaseImpl implements ValidTextIsNullUserCase {
  
  @override
  bool validTextIsNull(String value) {
    if (value.isEmpty) return false;
    return true;
  }

}