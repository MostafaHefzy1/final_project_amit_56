import '../../../core/base_widget/custom_app_bar.dart';
import '../../../core/helper/spacing.dart';
import '../logic/home_cubit.dart';
import 'widgets/banners_widget.dart';
import 'widgets/catogery_widget.dart';
import 'widgets/list_product_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home Screen"),
      body: RefreshIndicator(
        onRefresh: () {
          HomeCubit.get(context).getCategories();
          HomeCubit.get(context).getProducts();
          return HomeCubit.get(context).getBanners();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                verticleSpace(20),
                BannersWidget(),
                verticleSpace(10),
                ListCategoryWidget(),
                verticleSpace(10),
                const ListProductHome()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
