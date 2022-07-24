import 'package:flutter/material.dart';
import 'package:lista_de_afazeres/core/extension/string_extension.dart';

class TextList extends StatelessWidget {
  final String annotationEntity;
  final int flex;
  final double top;
  final double size;
  final double? left = 10;
  final double bottom;

  const TextList(this.annotationEntity,
      {Key? key,
      this.flex = 5,
      this.top = 10,
      this.size = 0.05,
      this.bottom = 0})
      : super(key: key);

  factory TextList.date(String annotationEntity) =>
      TextList(annotationEntity, flex: 0, top: 15.0, size: 0.030, bottom: 5);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.only(left: left!, top: top, bottom: bottom),
        child: Text(
          annotationEntity.capitalize(),
          maxLines: 5,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * size, color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
