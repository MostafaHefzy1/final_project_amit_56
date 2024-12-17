import '../../../../core/base_widget/custom_button.dart';
import '../../../../core/base_widget/loading_indictor.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../basic_app/logic/basic_app_cubit.dart';
import '../../logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CartButtonDetailsScreen extends StatelessWidget {
  bool inCart;
  final int productId;
  CartButtonDetailsScreen(
      {super.key, required this.inCart, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if(state is AddToCartsLoadingState){
          showLoadingIndictor(context) ; 
        }
        if (state is AddToCartsSuccessState) {
          Navigator.pop(context)  ;
          inCart = !inCart;
        }
      },
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Padding(
            padding: const EdgeInsets.all(8),
            child: inCart
                ? Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              text: "Go To Cart",
                              function: () {
                                BasicAppCubit.get(context).changeIndexBottomNavBar(1, context) ; 
                                Navigator.pushReplacementNamed(
                                    context, Routes.bottomNavBarScreen);
                              })),
                      horizontalSpace(8),
                      Expanded(
                          child: CustomButton(
                              text: "Remove In Cart",
                              function: () {
                                cubit.addCartsProducts(productId);
                              }))
                    ],
                  )
                : CustomButton(
                    text: "ADD To Cart",
                    function: () {
                      cubit.addCartsProducts(productId);
                    }));
      },
    );
  }
}
