import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_app/core/services/database_servies.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseServies databaseServies;

  ProductRepoImpl(this.databaseServies);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() {
    // TODO: implement getBestSellingProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
