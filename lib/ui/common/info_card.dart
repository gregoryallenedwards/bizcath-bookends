// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.body,
    this.onTap,
  });

  final String title;
  final String body;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ListTile(title: Text(title), subtitle: Text(body), onTap: onTap),
    );
  }
}
