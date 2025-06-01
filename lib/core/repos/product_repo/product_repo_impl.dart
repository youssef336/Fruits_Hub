import 'package:dartz/dartz.dart';
import 'package:fruits_hub_app/core/entities/product_entity.dart';
import 'package:fruits_hub_app/core/errors/failures.dart';
import 'package:fruits_hub_app/core/models/product_model.dart';
import 'package:fruits_hub_app/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_app/core/services/database_servies.dart';
import 'package:fruits_hub_app/core/utils/back_end_endpoints.dart';
import 'package:fruits_hub_app/generated/l10n.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseServies databaseServies;

  ProductRepoImpl(this.databaseServies);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data =
          await databaseServies.getData(
                path: BackEndEndpoints.getProducts,
                query: {
                  'limit': 6,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseServies.getData(path: BackEndEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productsEntity =
          products.map((e) => e.toEntity()).toList();

      return right(productsEntity);
    } catch (e) {
      return Left(
        ServerFailure(S.current.Custom_Exception_failed_toget_product),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getBestSellingProductMoreLimit() async {
    try {
      var data =
          await databaseServies.getData(
                path: BackEndEndpoints.getProducts,
                query: {'orderBy': 'sellingCount', 'descending': true},
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
