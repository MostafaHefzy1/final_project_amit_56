import 'package:final_project_amit56/features/favorite/logic/favorite_cubit.dart';
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
        if (state is AddOrDeleteFavoriteSuceess) {
          inFavorites = !inFavorites;
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
