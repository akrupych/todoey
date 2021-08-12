import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String text;
  final bool done;
  final Function(bool) onChanged;

  ListItem({required this.text, required this.done, required this.onChanged});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: TextStyle(
          decoration: widget.done ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: widget.done,
        onChanged: (checked) => widget.onChanged(checked ?? false),
      ),
    );
  }
}
