// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
