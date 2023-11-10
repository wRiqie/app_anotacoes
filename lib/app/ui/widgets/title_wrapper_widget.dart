import 'package:flutter/material.dart';

class TitleWrapperWidget extends StatelessWidget {
  final Widget title;
  final Widget child;
  const TitleWrapperWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        const SizedBox(
          height: 6,
        ),
        child,
      ],
    );
  }
}
