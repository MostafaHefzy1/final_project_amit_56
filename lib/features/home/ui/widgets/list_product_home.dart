// import 'package:final_project_amit56/core/base_widget/product_widget.dart';
// import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ListProductHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         var cubit = HomeCubit.get(context);
//         return cubit.list == null
//             ? SizedBox()
//             : GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 2 / 3.5,
//                   crossAxisSpacing: 2.w,
//                   mainAxisSpacing: 5.h,
//                 ),
//                 itemCount: cubit.list!.length,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (BuildContext context, int index) {
//                   return ProductWidget(
//                     productItem: cubit.list![index],
//                   );
//                 });
//       },
//     );
//   }
// }

import 'package:final_project_amit56/core/base_widget/product_widget.dart';
import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListProductHome extends StatelessWidget {
  const ListProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return cubit.list == null
            ? const SizedBox()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 5.h,
                ),
                itemCount: cubit.productsModel!.data!.listProductItem!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(
                    productItem: cubit.productsModel!.data!.listProductItem![index],
                  );
                });
      },
    );
  }
}
