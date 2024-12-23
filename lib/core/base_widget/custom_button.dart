import '../helper/default_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function function;
  final bool loading;
  final Color colorButton;
  const CustomButton(
      {super.key,
      required this.text,
      required this.function,
      this.loading = false,
      this.colorButton = Colors.brown});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: AppDimensions.defaultBorderRaduis,
      ),
      child: MaterialButton(
        onPressed: () => function(),
        child: loading
            ? Center(
                child: SpinKitThreeBounce(
                    color: Colors.white, size: 1.sw < 600 ? 0.04.sh : 0.06.sh),
              )
            : Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
    );
  }
}
