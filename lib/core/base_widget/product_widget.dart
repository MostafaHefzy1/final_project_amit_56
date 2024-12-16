import 'package:final_project_amit56/core/base_widget/custom_network_image.dart';
import 'package:final_project_amit56/core/helper/default_dimensions.dart';
import 'package:final_project_amit56/core/helper/spacing.dart';
import 'package:final_project_amit56/core/routing/routes.dart';
import 'package:final_project_amit56/core/theming/styles.dart';
import 'package:final_project_amit56/features/home/data/models/products_model.dart';
import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  final ProductItem productItem;

  const ProductWidget({super.key, required this.productItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          HomeCubit.get(context).getDetailsProduct(productItem.id!);
          Navigator.pushNamed(context, Routes.productDetailsScreen,
              arguments: productItem);
        },
        child: Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color(0xffC0C0C0),
              ),
              borderRadius: AppDimensions.defaultBorderRaduis,
              color: Colors.white,
            ),
            margin: EdgeInsetsDirectional.only(start: 1.w, end: 1.w, top: 1.h),
            child: Column(
              children: [
                CustomNetworkImage(
                    border:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    image: productItem.image ?? ""),
                verticleSpace(5),
                Center(
                  child: Text(productItem.name ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyles.font16BlackSemiBold),
                ),
                Center(
                  child: Text(productItem.description ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.font14GerySemiBold),
                ),
                productItem.oldPrice! == productItem.price
                    ? verticleSpace(10)
                    : const SizedBox(),
                productItem.oldPrice! == productItem.price
                    ? const SizedBox()
                    : Center(
                        child: Text(productItem.oldPrice.toString(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyles.font16BlackSemiBold.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red)),
                      ),
                Center(
                  child: Text(productItem.price.toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyles.font16BlackSemiBold.copyWith(
                        color: Colors.brown,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                verticleSpace(1)
              ],
            )));
  
  
  }
}
