import '../../../core/base_widget/custom_app_bar.dart';
import '../../../core/base_widget/loading_indictor.dart';
import '../../../core/theming/styles.dart';
import '../logic/cart_cubit.dart';
import 'widgets/cart_item.dart';
import 'widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(title: "Cart Screen"),
          body: cubit.cartsModel == null
              ? LoadingIndictor()
              : cubit.cartsModel!.data!.cartItems!.isEmpty
                  ? const EmptyCart()
                  : ListView.builder(
                      itemBuilder: (context, index) => CartItem(
                            itemsCart:
                                cubit.cartsModel!.data!.cartItems![index],
                          ),
                      itemCount: cubit.cartsModel!.data!.cartItems!.length),
          bottomNavigationBar: cubit.cartsModel == null ||
                  cubit.cartsModel!.data!.cartItems!.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Price",
                        style: TextStyles.font16BlackSemiBold,
                      ),
                      Text(
                        cubit.cartsModel?.data?.total.toString() ?? "",
                        style: TextStyles.font16BrownBold,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
