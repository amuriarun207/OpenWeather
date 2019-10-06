import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
     Key key, this.title, this.description,
  }) : super(key: key);

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 10.0,
            margin: const EdgeInsets.all(16.0),
            child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
            title: Text(title),
            subtitle: Text(description)
            )
            )
            );
  }
}
