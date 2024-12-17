import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/base_widget/custom_network_image.dart';
import '../../logic/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BannersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return cubit.bannersModel == null
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 180,
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ))
            : CarouselSlider(
                items: cubit.bannersModel!.data!
                    .map(
                      (banner) => CustomNetworkImage(
                        image: banner.image!,
                        border: const BorderRadius.all(Radius.circular(10)),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 180,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ));
      },
    );
  }
}
