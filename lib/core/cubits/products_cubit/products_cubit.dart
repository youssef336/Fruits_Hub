import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/providers/favorite_provider.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;
  int productsLength = 0;
  Future<void> getProducts({BuildContext? context}) async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFalure(failure.message)), 
      (products) async {
        productsLength = products.length;
        // Initialize favorites if context is provided
        if (context != null) {
          final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
          await favoriteProvider.loadFavorites(products);
        }
        emit(ProductsSuccess(products));
      }
    );
  }

  Future<void> getBestSellingProducts({BuildContext? context}) async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductsFalure(failure.message)), 
      (products) async {
        // Initialize favorites if context is provided
        if (context != null) {
          final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
          await favoriteProvider.loadFavorites(products);
        }
        emit(ProductsSuccess(products));
      }
    );
  }

  Future<void> getBestSellingProductsMoreLimit({BuildContext? context}) async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProductMoreLimit();
    result.fold(
      (failure) => emit(ProductsFalure(failure.message)), 
      (products) async {
        // Initialize favorites if context is provided
        if (context != null) {
          final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
          await favoriteProvider.loadFavorites(products);
        }
        emit(ProductsSuccess(products));
      }
    );
  }
}
