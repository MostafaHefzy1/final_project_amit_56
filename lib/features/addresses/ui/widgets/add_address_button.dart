import '../../../../core/app_import/app_import.dart';
import '../../logic/addresses_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressButtonWidget extends StatelessWidget {
  const AddAddressButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AddressesCubit.get(context).clearTextForFiled();
        Navigator.pushNamed(context, Routes.addUpdateDeleteAddressScreen);
      },
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.brown),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Add Address",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
