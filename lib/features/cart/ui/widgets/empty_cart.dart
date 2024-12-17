import '../../../../core/base_widget/custom_button.dart';
import '../../../basic_app/logic/basic_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'سلة الشراء فارغة',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 0.1.h,
            ),
            const Text(
              'فى حالة رغبتك فى أضافة منتجات \nالى سلة الشراء عليك بتصفح المنتجات',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              function: () {
                BasicAppCubit.get(context).changeIndexBottomNavBar(0, context);
              },
              text: 'الذهاب للصفحة الرئيسية',
            ),
          ],
        ),
      ),
    );
  }
}
