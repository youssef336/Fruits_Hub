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
                path: BackEndEndpoints.getproducts,

                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<Productmodel> products =
          data.map((e) => Productmodel.fromJson(e)).toList();
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
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseServies.getData(path: BackEndEndpoints.getproducts)
              as List<Map<String, dynamic>>;
      List<Productmodel> products =
          data.map((e) => Productmodel.fromJson(e)).toList();
      List<ProductEntity> productsEntity =
          products.map((e) => e.toEntity()).toList();

      return right(productsEntity);
    } catch (e) {
      return Left(
        ServerFailure(S.current.Custom_Exception_failed_toget_product),
      );
    }
  }
}
