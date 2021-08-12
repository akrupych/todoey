import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final bool done;
  final Function(bool) onChanged;

  ListItem({required this.text, required this.done, required this.onChanged});

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
    );
  }
}
