import 'package:bloc/bloc.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';

import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFalure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFalure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}
