import '../../../../core/base_widget/custom_network_image.dart';
import '../../../../core/base_widget/loading_indictor.dart';
import '../../../../core/helper/default_dimensions.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/carts_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartItems itemsCart;

  const CartItem({super.key, required this.itemsCart});
  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is UpdateToCartsLoadingState) {
          showLoadingIndictor(context);
        }
        if (state is DeleteToCartsLoadingState) {
          showLoadingIndictor(context);
        }
        if (state is GetCartsSuccessState &&
            (cubit.cartsModel != null && cubit.cartsModel!.data!.total != 0)) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
              borderRadius: AppDimensions.defaultBorderRaduis,
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: CustomNetworkImage(
                      image: itemsCart.product?.image ?? "")),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemsCart.product?.name ?? "",
                        style: TextStyles.font14GerySemiBold),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text("${"Qty"}: ",
                            style: TextStyles.font16BlackSemiBold),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 2.h),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius:
                                      AppDimensions.defaultBorderRaduis),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (itemsCart.quantity == 1) {
                                        cubit
                                            .deleteCartsProducts(itemsCart.id!);
                                      } else {
                                        cubit.updateCartsProducts(itemsCart.id!,
                                            itemsCart.quantity! - 1);
                                      }
                                    },
                                    child: CircleAvatar(
                                        radius: 15.r,
                                        backgroundColor: Colors.grey,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.minimize_outlined,
                                            size: 15.w,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    "${itemsCart.quantity}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cubit.updateCartsProducts(itemsCart.id!,
                                          itemsCart.quantity! + 1);
                                    },
                                    child: CircleAvatar(
                                        radius: 15.r,
                                        backgroundColor: Colors.grey,
                                        child: const Icon(
                                          Icons.add,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  cubit.deleteCartsProducts(itemsCart.id!);
                                },
                                icon: const Icon(
                                  CupertinoIcons.trash,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "${"price"}: ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: const Color(0xFF505050),
                                    fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                            text: '${itemsCart.product?.price ?? ""}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                          )
                        ])),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
