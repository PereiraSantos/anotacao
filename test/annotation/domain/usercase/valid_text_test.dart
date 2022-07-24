import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/valid_date_text_is_null_usercase_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/valid_text_is_big_usercase_impl.dart';
import 'package:lista_de_afazeres/annotation/domain/usercases/valid_text_is_null_usercase_impl.dart';

void main() {
 
  group("Teste texto is nulo-> ", () {
    test('Espero que retorne true', () {
      String value = "solid";
      var result = ValidTextIsNullUserCaseImpl().validTextIsNull(value);
      expect(result, true);
    });
    test('Espero que retorne false', () {
      String value = "";
      var result = ValidTextIsNullUserCaseImpl().validTextIsNull(value);
      expect(result, false);
    });
  });

  group("Teste text muito grande -> ", () {
    test('Espero que retorne true', () {
      String value = "solid";
      var result = ValidTextIsBigUserCaseImpl().validTextIsBig(value);
      expect(result, true);
    });
    test('Espero que retorne false', () {
      String value =
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
      var result = ValidTextIsBigUserCaseImpl().validTextIsBig(value);
      expect(result, false);
    });
  });

  group('Valida data -> ', () {
    test("Espero de retorn true", () {
      String value = "01/01/2022";
      var result = ValidDateIsNullUserCaseImpl().validDateIsNull(value);
      expect(result, true);
    });

    test("Espero de retorn false", () {
      String value = "";
      var result = ValidDateIsNullUserCaseImpl().validDateIsNull(value);
      expect(result, false);
    });
  });
}
