import '../../../../core/app_import/app_import.dart';
import '../../../../core/base_widget/row_text.dart';
import '../../../../core/helper/default_dimensions.dart';
import '../../data/models/get_addresse_model.dart';
import '../../logic/addresses_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatelessWidget {
  final AddresseItem addresseItem;

  const AddressWidget({super.key, required this.addresseItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddressesCubit.get(context).fillTextForFiled(addresseItem);
        Navigator.pushNamed(context, Routes.addUpdateDeleteAddressScreen,
            arguments: addresseItem);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: AppDimensions.defaultBorderRaduis),
        child: Column(
          children: [
            RowText(title: "Name", subTitle: addresseItem.name ?? ""),
            RowText(title: "City", subTitle: addresseItem.city ?? ""),
            RowText(title: "Region", subTitle: addresseItem.region ?? ""),
            RowText(title: "Details", subTitle: addresseItem.details ?? ""),
            RowText(title: "Notes", subTitle: addresseItem.notes ?? ""),
          ],
        ),
      ),
    );
  }
}
