import 'package:final_project_amit56/core/base_widget/custom_app_bar.dart';
import 'package:final_project_amit56/core/base_widget/product_widget.dart';
import 'package:final_project_amit56/features/home/data/models/categories_model.dart';
import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductByCatogery extends StatelessWidget {
  final CategoriesItem categoriesItem;

  const ProductByCatogery({super.key, required this.categoriesItem});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            title: categoriesItem.name!,
            isBack: true,
          ),
          body: cubit.catogeryProductModel == null
              ? const Center(
                  child: SpinKitFadingCube(
                  color: Colors.brown,
                ))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3.5,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 5.h,
                  ),
                  itemCount:
                      cubit.catogeryProductModel!.data!.listProductItem!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(
                      productItem: cubit
                          .catogeryProductModel!.data!.listProductItem![index],
                    );
                  }),
        );
      },
    );
  }
}
