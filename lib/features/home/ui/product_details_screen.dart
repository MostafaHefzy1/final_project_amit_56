import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_amit56/core/base_widget/custom_button.dart';
import 'package:final_project_amit56/core/base_widget/custom_network_image.dart';
import 'package:final_project_amit56/core/helper/spacing.dart';
import 'package:final_project_amit56/core/theming/styles.dart';
import 'package:final_project_amit56/features/favorite/ui/widgets/favorite_item_details_productd.dart';
import 'package:final_project_amit56/features/home/data/models/details_product_model.dart';
import 'package:final_project_amit56/features/home/data/models/products_model.dart';
import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductItem productItem;
  const ProductDetailsScreen({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    DetailsProductsModel? detailsProductsModel;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetDetailsSuccessState) {
          detailsProductsModel = state.detailsProductsModel;
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return detailsProductsModel == null
            ? Scaffold(
                body: const Center(
                    child: SpinKitFadingCube(
                  color: Colors.brown,
                )),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  actions: [
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       cubit.detailsProductsModel!.data!.inFavorites!
                    //           ? Icons.favorite
                    //           : Icons.favorite_border_sharp,
                    //       color: cubit.detailsProductsModel!.data!.inFavorites!
                    //           ? Colors.red
                    //           : null,
                    //     ))
                    FavoriteItemDetailsProductd(
                      productId: detailsProductsModel!.data!.id!,
                      inFavorites: detailsProductsModel!.data!.inFavorites!,
                    )
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                          items: detailsProductsModel!.data!.images!
                              .map(
                                (image) => CustomNetworkImage(
                                  image: image,
                                  border: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: 250,
                            initialPage: 0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          )),
                      verticleSpace(10),
                      Text(
                        detailsProductsModel?.data?.name ?? "",
                        style: TextStyles.font14GerySemiBold
                            .copyWith(color: Colors.brown),
                      ),
                      Text(
                        detailsProductsModel?.data?.description ?? "",
                        style: TextStyles.font14GerySemiBold
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        detailsProductsModel!.data!.oldPrice.toString(),
                        style: TextStyles.font16BlackSemiBold,
                      ),
                      Text(
                        detailsProductsModel!.data!.price.toString(),
                        style: TextStyles.font16BlackSemiBold,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: detailsProductsModel!.data!.inCart!
                      ? CustomButton(text: "Go To Cart", function: () {})
                      : CustomButton(text: "ADD To Cart", function: () {}),
                ),
              );
      },
    );
  }
}
