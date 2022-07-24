import 'valid_text_is_null_usercase_impl.dart';

class ValidDateIsNullUserCaseImpl extends ValidTextIsNullUserCaseImpl {

  ValidDateIsNullUserCaseImpl() : super();

  bool validDateIsNull(String value){
    return super.validTextIsNull(value);
  }
}