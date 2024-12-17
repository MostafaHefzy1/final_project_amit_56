import '../helper/spacing.dart';
import 'package:flutter/material.dart';


class CustomFailureText extends StatelessWidget {
  final String errorText;

  const CustomFailureText({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      verticleSpace(5),
      Align(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          errorText,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      )
    ]);
  }
}
