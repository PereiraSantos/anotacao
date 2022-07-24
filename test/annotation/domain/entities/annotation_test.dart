import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_afazeres/annotation/domain/entities/annotation.dart';

main() {
  test("Espero que exista o objeto", () async {
    AnnotationEntity annotationEntity = AnnotationEntity(
      id: 1, 
      text: "Estudar solid", 
      dateText: "01/01/2022"
      );

    expect(annotationEntity, isNotNull);
  });
}
