import '../../../../core/base_widget/custom_network_image.dart';
import '../../../../core/helper/default_dimensions.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/categories_model.dart';
import '../../logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final CategoriesItem categoriesItem;

  const CategoryWidget({super.key, required this.categoriesItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context).catogeryProductModel = null;
        HomeCubit.get(context).getProducts(categoryId: categoriesItem.id);
        Navigator.pushNamed(context, Routes.productByCatogery,
            arguments: categoriesItem);
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: AppDimensions.defaultBorderRaduis,
          border: Border.all(width: 2.5, color: Colors.grey.withOpacity(0.1)),
        ),
        margin: EdgeInsets.all(2.w),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 6,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: AppDimensions.defaultBorderRaduis,
                ),
                child: CustomNetworkImage(
                  image: categoriesItem.image!,
                )),
          ),
          Expanded(
              flex: 3,
              child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: AppDimensions.defaultRadius,
                        bottomRight: AppDimensions.defaultRadius),
                  ),
                  child: Text(
                    categoriesItem.name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,

                    //    TextStyle(
                    //       fontSize: 16.sp,
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w600),
                    // )
                  ))),
        ]),
      ),
    );
  }
}

class ListCategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return cubit.categoriesModel == null
            ? const SizedBox()
            : SizedBox(
                height: 120.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CategoryWidget(
                          categoriesItem:
                              cubit.categoriesModel!.data!.data![index],
                        ),
                    separatorBuilder: (context, index) => horizontalSpace(5),
                    itemCount: cubit.categoriesModel!.data!.data!.length),
              );
      },
    );
  }
}
