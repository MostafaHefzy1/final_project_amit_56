import 'package:final_project_amit56/core/base_widget/custom_app_bar.dart';
import 'package:final_project_amit56/core/helper/spacing.dart';
import 'package:final_project_amit56/features/home/ui/widgets/banners_widget.dart';
import 'package:final_project_amit56/features/home/ui/widgets/catogery_widget.dart';
import 'package:final_project_amit56/features/home/ui/widgets/list_product_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home Screen"),
      body: SingleChildScrollView(
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
    );
  }
}
