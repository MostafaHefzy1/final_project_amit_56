import '../../../../core/base_widget/loading_indictor.dart';
import '../../logic/favorite_cubit.dart';
import '../../../home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItemDetailsProductd extends StatelessWidget {
  bool inFavorites;
  final int productId;

  FavoriteItemDetailsProductd(
      {super.key, required this.inFavorites, required this.productId});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is AddOrDeleteFavoriteLoading) {
          showLoadingIndictor(context);
        }
        if (state is AddOrDeleteFavoriteSuceess) {
          Navigator.pop(context) ; 
          print("inFavorites before $inFavorites");
          inFavorites = !inFavorites;
          print("inFavorites After $inFavorites");
          // HomeCubit.get(context).getDetailsProduct(productId);
        }
      },
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return IconButton(
            onPressed: () {
              cubit.addOrDeleteFavoriteProduct(productId);
            },
            icon: Icon(
              inFavorites ? Icons.favorite : Icons.favorite_border_sharp,
              color: inFavorites ? Colors.red : null,
            ));
      },
    );
  }
}
