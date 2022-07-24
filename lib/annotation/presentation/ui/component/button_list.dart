import 'package:flutter/material.dart';

class ButtonList extends StatelessWidget {
  final MaterialColor color;
  final Function onClick;
  final IconData icon;

  const ButtonList(this.onClick,
      {Key? key, this.color = Colors.blue, this.icon = Icons.edit})
      : super(key: key);

  factory ButtonList.delete(Function onClick) =>
      ButtonList(onClick, color: Colors.red, icon: Icons.delete);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: IconButton(
        onPressed: () => onClick(),
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
