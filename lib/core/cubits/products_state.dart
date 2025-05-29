part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}

class ProductsFalure extends ProductsState {
  final String error;
  ProductsFalure(this.error);
}
