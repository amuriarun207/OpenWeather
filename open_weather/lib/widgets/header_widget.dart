
import 'package:flutter/material.dart';


class HeaderWidget extends StatelessWidget {
   const HeaderWidget({
     Key key, this.title
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}