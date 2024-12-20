import '../../../core/routing/routes.dart';
import '../../home/logic/home_cubit.dart';

import '../../../core/base_widget/custom_app_bar.dart';
import '../../../core/base_widget/custom_network_image.dart';
import '../../../core/base_widget/loading_indictor.dart';
import '../../../core/helper/default_dimensions.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/styles.dart';
import '../logic/favorite_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Favorites",
          ),
          body: cubit.favoriteProductsModel == null
              ? LoadingIndictor()
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3.5,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 5.h,
                  ),
                  itemCount: cubit.favoriteProductsModel!.data!.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          HomeCubit.get(context).getDetailsProduct(cubit
                              .favoriteProductsModel!
                              .data!
                              .data![index]
                              .product!
                              .id!);
                          Navigator.pushNamed(
                              context, Routes.productDetailsScreen,
                              arguments: cubit.favoriteProductsModel!.data!
                                  .data![index].product!.id);
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
                            margin: EdgeInsetsDirectional.only(
                                start: 1.w, end: 1.w, top: 1.h),
                            child: Column(
                              children: [
                                CustomNetworkImage(
                                    border: const BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    image: cubit.favoriteProductsModel!.data!
                                            .data![index].product!.image ??
                                        ""),
                                verticleSpace(5),
                                Center(
                                  child: Text(
                                      cubit.favoriteProductsModel!.data!
                                              .data![index].product!.name ??
                                          "",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyles.font16BlackSemiBold),
                                ),
                                Center(
                                  child: Text(
                                      cubit
                                              .favoriteProductsModel!
                                              .data!
                                              .data![index]
                                              .product!
                                              .description ??
                                          "",
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyles.font14GerySemiBold),
                                ),
                                cubit.favoriteProductsModel!.data!.data![index]
                                            .product!.oldPrice! ==
                                        cubit.favoriteProductsModel!.data!
                                            .data![index].product!.price
                                    ? verticleSpace(10)
                                    : const SizedBox(),
                                cubit.favoriteProductsModel!.data!.data![index]
                                            .product!.oldPrice! ==
                                        cubit.favoriteProductsModel!.data!
                                            .data![index].product!.price
                                    ? const SizedBox()
                                    : Center(
                                        child: Text(
                                            cubit.favoriteProductsModel!.data!
                                                .data![index].product!.oldPrice
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyles
                                                .font16BlackSemiBold
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor:
                                                        Colors.red)),
                                      ),
                                Center(
                                  child: Text(
                                      cubit.favoriteProductsModel!.data!
                                          .data![index].product!.price
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyles.font16BlackSemiBold
                                          .copyWith(
                                        color: Colors.brown,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                verticleSpace(1)
                              ],
                            )));
                  }),
        );
      },
    );
  }
}
