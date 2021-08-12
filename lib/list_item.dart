import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final bool done;
  final Function(bool) onChanged;
  final Function() onLongPress;

  ListItem(
      {required this.text,
      required this.done,
      required this.onChanged,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          decoration: done ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: done,
        onChanged: (checked) => onChanged(checked ?? false),
      ),
      onLongPress: onLongPress,
    );
  }
}
