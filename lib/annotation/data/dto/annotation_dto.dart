import '../../domain/entities/annotation.dart';

class AnnotationDto extends AnnotationEntity {
  String? texto;
  String? dataTexto;

  AnnotationDto({
    this.texto,
    this.dataTexto,
  }) : super(
          id: null,
          text: texto,
          dateText: dataTexto,
        );

  Map toMap() {
    return {
      'texto': texto,
      'dataTexto': dataTexto,
    };
  }

  Map<String, dynamic> fromMap(AnnotationEntity annotationEntity) {
    return {
      'texto': annotationEntity.text,
      'dataTexto': annotationEntity.dateText,
    };
  }

  static AnnotationDto fromJson(Map map) {
    return AnnotationDto(
      texto: map['texto'],
      dataTexto: map['dataTexto'],
    );
  }
}
