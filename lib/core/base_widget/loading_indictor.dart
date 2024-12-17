import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndictor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitFadingCube(
      color: Colors.brown,
    ));
  }
}

void showLoadingIndictor(context) {
  showDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      builder: (BuildContext cotext) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: LoadingIndictor(),
        );
      });
}
